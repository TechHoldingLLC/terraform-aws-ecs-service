## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_ecs_service.service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autoscaling"></a> [autoscaling](#input\_autoscaling) | Autoscaling enabled | `bool` | n/a | yes |
| <a name="input_autoscaling_target_cpu"></a> [autoscaling\_target\_cpu](#input\_autoscaling\_target\_cpu) | Autoscaling target cpu | `number` | `70` | no |
| <a name="input_capacity_provider_strategy"></a> [capacity\_provider\_strategy](#input\_capacity\_provider\_strategy) | proper weights to associate to Fargate & Fargate spot | `map(number)` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | ECS container port | `number` | n/a | yes |
| <a name="input_desired_task_count"></a> [desired\_task\_count](#input\_desired\_task\_count) | ECS desired task count to be running | `number` | n/a | yes |
| <a name="input_ecs_cluster_id"></a> [ecs\_cluster\_id](#input\_ecs\_cluster\_id) | ECS cluster id | `string` | n/a | yes |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | Task warm up time before health checks in seconds | `number` | `0` | no |
| <a name="input_max_autoscaling_task_count"></a> [max\_autoscaling\_task\_count](#input\_max\_autoscaling\_task\_count) | Maximum task count in autoscaling | `number` | `5` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | ECS security group id | `list(any)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | VPC subnets id | `list(any)` | n/a | yes |
| <a name="input_target_groups_arn"></a> [target\_groups\_arn](#input\_target\_groups\_arn) | Target groups arn | `list(any)` | `[]` | no |
| <a name="input_task_definition_arn"></a> [task\_definition\_arn](#input\_task\_definition\_arn) | ECS task definition arn | `string` | n/a | yes |
| <a name="input_task_definition_name"></a> [task\_definition\_name](#input\_task\_definition\_name) | ECS task definition name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | n/a |

## License

Apache 2 Licensed. See [LICENSE](https://github.com/TechHoldingLLC/terraform-aws-ecs-service/blob/main/LICENSE) for full details.