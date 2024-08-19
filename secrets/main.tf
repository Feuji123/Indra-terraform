terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_secretsmanager_secret" "global_secrets" {
  name = var.global_secret_name
  tags = {
    "CustomerName" = var.customer_name_tag
  }
}

resource "aws_secretsmanager_secret_version" "global_secret_version" {
  secret_id     = aws_secretsmanager_secret.global_secrets.id
  secret_string = jsonencode({
    "ElastiCacheSettings__HostAndPort" = var.ElastiCacheSettings__HostAndPort
    "ElastiCacheSettings__Ssl" = var.ElastiCacheSettings__Ssl
    "ElastiCacheSettings__Password" = var.ElastiCacheSettings__Password
    "ElastiCacheSettings__TransactionBatchSize" = var.ElastiCacheSettings__TransactionBatchSize
    "SqsSettings__QueueName" = var.SqsSettings__QueueName
    "SqsSettings__DeadLetterQueueName" = var.SqsSettings__DeadLetterQueueName
    "SqsSettings__MaxNumberOfMessages" = var.SqsSettings__MaxNumberOfMessages
    "SqsSettings__VisibilityTimeoutSeconds" = var.SqsSettings__VisibilityTimeoutSeconds
    "SqsSettings__WaitTimeSeconds" = var.SqsSettings__WaitTimeSeconds
    "SqsSettings__SleepingTimeSeconds" = var.SqsSettings__SleepingTimeSeconds
    "TenantGroupSettings__TenantSettings__0__Name" = var.TenantGroupSettings__TenantSettings__0__Name
    "TenantGroupSettings__TenantSettings__0__OdysseyApiBasePath" = var.TenantGroupSettings__TenantSettings__0__OdysseyApiBasePath
    "TenantGroupSettings__TenantSettings__1__Name" = var.TenantGroupSettings__TenantSettings__1__Name
    "TenantGroupSettings__TenantSettings__1__OdysseyApiBasePath" = var.TenantGroupSettings__TenantSettings__1__OdysseyApiBasePath
  })
}

variable "customer_name_tag" {
  type    = string
  default = "tag"
}

variable "global_secret_name" {
  type    = string
  description = "Please entered the preferred name of the global secret"
  default = "globe2"
}

variable "ElastiCacheSettings__HostAndPort" {
  type    = string
}

variable "ElastiCacheSettings__Ssl" {
  type    = string
}

variable "ElastiCacheSettings__Password" {
  type    = string
}

variable "ElastiCacheSettings__TransactionBatchSize" {
  type    = string
}

variable "SqsSettings__QueueName" {
  type    = string
}

variable "SqsSettings__DeadLetterQueueName" {
  type    = string
}

variable "SqsSettings__MaxNumberOfMessages" {
  type    = string
}

variable "SqsSettings__VisibilityTimeoutSeconds" {
  type    = string
}

variable "SqsSettings__WaitTimeSeconds" {
  type    = string
}

variable "SqsSettings__SleepingTimeSeconds" {
  type    = string
}

variable "TenantGroupSettings__TenantSettings__0__Name" {
  type    = string
}

variable "TenantGroupSettings__TenantSettings__0__OdysseyApiBasePath" {
  type    = string
}

variable "TenantGroupSettings__TenantSettings__1__Name" {
  type    = string
}

variable "TenantGroupSettings__TenantSettings__1__OdysseyApiBasePath" {
  type    = string
}
