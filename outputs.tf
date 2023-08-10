############################
#  ecs-service/outputs.tf  #
############################

output "service_name" {
  value = aws_ecs_service.service.name
}