########################
#  ecs-service/ecs.tf  #
########################


resource "aws_ecs_service" "service" {
  name                              = var.name
  cluster                           = var.ecs_cluster_id
  task_definition                   = var.task_definition_arn
  desired_count                     = var.desired_task_count
  health_check_grace_period_seconds = var.health_check_grace_period_seconds
  launch_type                       = length(var.capacity_provider_strategy) > 0 ? null : var.launch_type

  network_configuration {
    security_groups = var.security_group_ids
    subnets         = var.subnets
  }

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      base              = try(capacity_provider_strategy.value.base, null)
      weight            = try(capacity_provider_strategy.value.weight, null)
      capacity_provider = capacity_provider_strategy.key
    }
  }

  dynamic "ordered_placement_strategy" {
    for_each = var.ordered_placement_strategy

    content {
      field = try(ordered_placement_strategy.value.field, null)
      type  = ordered_placement_strategy.value.type
    }
  }

  dynamic "load_balancer" {
    for_each = length(var.load_balancer) > 0 ? [var.load_balancer] : []
    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }

  dynamic "service_connect_configuration" {
    for_each = length(var.service_connect_config) > 0 ? [var.service_connect_config] : []
    content {
      enabled   = service_connect_configuration.value.enabled
      namespace = service_connect_configuration.value.namespace

      dynamic "service" {
        for_each = try([service_connect_configuration.value.service], [])

        content {
          port_name      = service.value.port_name
          discovery_name = service.value.discovery_name

          dynamic "client_alias" {
            for_each = try([service.value.client_alias], [])
            content {
              port     = client_alias.value.port
              dns_name = client_alias.value.dns_name
            }
          }
        }
      }
    }
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  tags = merge(var.tags, {
    Name = var.name
  })
  # If propagate tags are set to NONE, the ECS task will not have any tags. With propagate tags, we can specify whether the task will inherit tags from the service or the task definition.  
  propagate_tags = var.propagate_tags
  # If ECS managed tags are enabled, the ECS task will automatically be tagged with the ECS service and cluster names.
  enable_ecs_managed_tags = var.enable_ecs_managed_tags
  # If true, Terraform will wait for the service to reach a steady state. like `aws ecs wait services-stable`
  wait_for_steady_state = var.wait_for_steady_state

  lifecycle {
    ignore_changes = [desired_count]
  }
}