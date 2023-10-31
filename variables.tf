##############################
#  ecs-service/variables.tf  #
##############################

variable "autoscaling" {
  description = "Autoscaling enabled"
  type        = bool
}

variable "autoscaling_target_cpu" {
  description = "Autoscaling target cpu"
  type        = number
  default     = 70
}

variable "capacity_provider_strategy" {
  description = "proper weights to associate to Fargate & Fargate spot"
  type        = map(number)
}

variable "container_port" {
  description = "ECS container port"
  type        = number
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

variable "task_definition_name" {
  description = "ECS task definition name"
  type        = string
}

variable "task_definition_arn" {
  description = "ECS task definition arn"
  type        = string
}

variable "target_groups_arn" {
  description = "Target groups arn"
  type        = list(any)
  default     = []
}