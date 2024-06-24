##############################
#  ecs-service/variables.tf  #
##############################

variable "autoscaling" {
  description = "Autoscaling enabled"
  type        = bool
  default     = false
}

variable "autoscaling_policy" {
  description = "Autoscaling target value for CPU/Memory"
  type = list(object({
    name                   = string
    scale_in_cooldown      = number
    scale_out_cooldown     = number
    target_value           = number
    predefined_metric_type = string
  }))
  default = []
}

variable "capacity_provider_strategy" {
  description = "proper weights to associate to Fargate & Fargate spot"
  type        = map(number)
  default     = {}
}

variable "desired_task_count" {
  description = "ECS desired task count to be running"
  type        = number
}

variable "ecs_cluster_id" {
  description = "ECS cluster id"
  type        = string
}

variable "health_check_grace_period_seconds" {
  description = "Task warm up time before health checks in seconds"
  type        = number
  default     = 0
}

variable "max_autoscaling_task_count" {
  description = "Maximum task count in autoscaling"
  type        = number
  default     = 5
}

variable "min_autoscaling_task_count" {
  description = "Minimum task count in autoscaling"
  type        = number
  default     = 1
}

variable "name" {
  description = "ECS task definition name"
  type        = string
}

variable "security_group_ids" {
  description = "ECS security group id"
  type        = list(any)
  default     = []
}

variable "subnets" {
  description = "VPC subnets id"
  type        = list(any)
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "task_definition_arn" {
  description = "ECS task definition arn"
  type        = string
}

variable "load_balancer" {
  description = "Load balancer config"
  type        = map(any)
  default     = {}
}

variable "service_connect_config" {
  description = "Service connect configuration"
  type        = map(any)
  default     = {}
}

variable "propagate_tags" {
  description = "Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE, TASK_DEFINITION and NONE"
  type        = string
  default     = "TASK_DEFINITION"
}

variable "enable_ecs_managed_tags" {
  description = "Specifies whether to enable Amazon ECS managed tags for the tasks within the service."
  type        = bool
  default     = true
}