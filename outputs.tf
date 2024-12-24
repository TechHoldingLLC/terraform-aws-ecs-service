############################
#  ecs-service/outputs.tf  #
############################

output "name" {
  value = aws_ecs_service.service.name
}

output "arn" {
  value = aws_ecs_service.service.id
}