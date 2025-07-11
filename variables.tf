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
  type        = map(any)
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

variable "name" {
  description = "ECS task definition name"
  type        = string
}

variable "security_group_ids" {
  description = "ECS security group id"
  type        = list(any)
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

variable "launch_type" {
  description = "ECS task launchtype"
  type        = string
  default     = "FARGATE"
}

variable "service_connect_config" {
  description = "Service connect configuration"
  type        = any
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

variable "ordered_placement_strategy" {
  description = "Service level strategy rules that are taken into consideration during task placement. List from top to bottom in order of precedence"
  type        = any
  default     = {}
}

variable "wait_for_steady_state" {
  description = "If true, Terraform will wait for the service to reach a steady state."
  type        = bool
  default     = false
}

variable "assign_public_ip" {
  description = "Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false."
  type        = bool
  default     = false
}

variable "service_registries" {
  description = "Service discovery registries for the service"
  type        = any
  default     = {}
}

variable "deployment_circuit_breaker" {
  description = "Configuration block for deployment circuit breaker"
  type        = any
  default     = {}
}
