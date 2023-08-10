# ECS Service
Below is an examples of calling this module.

Note: By default, autoscaling_target_cpu is set to 70, max_autoscaling_task_count is set to 5 , target_groups_arn is set to [] and health_check_grace_period_seconds is set to 0 in this module.

## Create ECS Service
```
module "ecs_service" {
  source               = "./ecs-service"
  ecs_cluster_id       = cluster_name
  container_port       = 80
  task_definition_name = "demo-ecs-service"
  task_definition_arn  = ecs_task_definition_arn
  target_groups_arn = [
    target_group_arn
  ]
  desired_task_count                = 1
  autoscaling                       = true
  max_autoscaling_task_count        = 5
  autoscaling_target_cpu            = 70
  subnets                           = [ecs_subnets_ids]
  security_group_ids                = [security_group_ids]
  health_check_grace_period_seconds = 30
  capacity_provider_strategy = {
    "FARGATE"      = 1
    "FARGATE_SPOT" = 1
    }
}
```

