########################
#  ecs-service/ecs.tf  #
########################


resource "aws_ecs_service" "service" {
  name                              = var.task_definition_name
  cluster                           = var.ecs_cluster_id
  task_definition                   = var.task_definition_arn
  desired_count                     = var.desired_task_count
  health_check_grace_period_seconds = var.health_check_grace_period_seconds

  network_configuration {
    security_groups = var.security_group_ids
    subnets         = var.subnets
  }

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      weight            = capacity_provider_strategy.value
      capacity_provider = capacity_provider_strategy.key
    }
  }

  dynamic "load_balancer" {
    for_each = toset(var.target_groups_arn)
    content {
      target_group_arn = load_balancer.key
      container_name   = var.task_definition_name
      container_port   = var.container_port
    }
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  lifecycle {
    ignore_changes  = [desired_count]
    prevent_destroy = true
  }
}