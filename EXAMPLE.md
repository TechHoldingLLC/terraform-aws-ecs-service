# ECS Service
Below is an examples of calling this module.

## Create ECS Service
```
module "ecs_service" {
  source               = "git::https://github.com/TechHoldingLLC/terraform-aws-ecs-service.git"
  ecs_cluster_id       = cluster_name
  name                 = "demo-ecs-service"
  task_definition_arn  = ecs_task_definition_arn
  load_balancer = {
    target_group_arn = target_group_arn
    container_port   = 80
    container_name   = "demo-ecs-service"
  }
  desired_task_count                = 1
  autoscaling                       = true  # Set it false, if you don't require autoscaling
  autoscaling_policy = [
    {
      name                   = "CPU policy"
      scale_in_cooldown      = 90
      scale_out_cooldown     = 90
      target_value           = 70
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    },
    {
      name                   = "Memory policy"
      scale_in_cooldown      = 90
      scale_out_cooldown     = 100
      target_value           = 70
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
  ]
  max_autoscaling_task_count        = 5
  subnets                           = [ecs_subnets_ids]
  security_group_ids                = [security_group_ids]
  service_connect_config = {
    enabled   = true
    namespace = << service_connect_namespace >>

    service = {
      port_name      = << service_connect_portname >>
      discovery_name = << service_connect_displayname >>
      client_alias = {
        port     = var.ecs_task_container_port
        dns_name = << service_connect_dnsname >>
      }
    }
  }
  ordered_placement_strategy = {
    "ex-ecs" = {
      type  = "spread"                          #Other possible values random, binpack
      field = "attribute:ecs.availability-zone" #Not required when type is random
    }
  }
  health_check_grace_period_seconds = 30
  wait_for_steady_state             = true
  capacity_provider_strategy = {
    "FARGATE" = {
      base   = 10
      weight = 40
    }
    "FARGATE_SPOT" = {
      base   = 10
      weight = 60
    }
    }
}
```

