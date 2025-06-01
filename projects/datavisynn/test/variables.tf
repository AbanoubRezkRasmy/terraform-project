variable "env" {
  type = string
}
variable "region" {
  type    = string
  default = ""
}

/* ----------------------------------- VPC ---------------------------------- */
variable "vpc_cidr" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "private_subnet_cidrs" {
  type = list(string)
}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}

/* ----------------------------------- EKS ---------------------------------- */
variable "cluster_name" {
  type    = string
  default = ""
}
variable "cluster_version" {
  type = string
}
variable eks_role_name {
  type = string
}
variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  type        = bool
  default     = true
}
variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  type        = bool
  default     = false
}
variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

/* ------------------------------ EKS-NodeGroup ----------------------------- */
variable "node_group_name" {
  type = string
}
variable "eks_nodes_role_name" {
  type = string
}
variable "node_group_ami_type" {
  type    = string
  default = "AL2_x86_64"
}
variable "node_group_desired_size" {
  type = number
}
variable "node_group_max_size" {
  type = number
}
variable "node_group_min_size" {
  type = number
}
variable "node_group_capacity_type" {
  type = string
}
variable "node_group_disk_size" {
  type = number
}
variable "node_group_instance_types" {
  type = list(any)
}
variable "use_taint" {
  type    = bool
  default = false
}
variable "taint_key" {
  type    = string
  default = ""
}
variable "taint_value" {
  type    = string
  default = ""
}
variable "taint_effect" {
  type    = string
  default = ""
}

/* -------------------------------- EKS-Addon ------------------------------- */
variable "ingress_group_name" {
  type = string
}
variable "argocd_domain_name" {
  type = string
}
variable "certificate_arn" {
  type = string
}

/* ------------------------------- Route 53 -------------------------------- */
variable "domain" {
  type = string
}

/* ------------------------------- ExternalDNS ------------------------------ */
variable "ACM_zone_type" {
  type = string
}

/* -------------------------------------------------------------------------- */
/*                                     SG                                     */
/* -------------------------------------------------------------------------- */

/* --------------------------------- ALB_SG --------------------------------- */
variable "alb_sg_name" {
  type = string
}

variable "ALB_ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}
variable "ALB_egress_rules" {
  description = "List of egress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "alb_sg_description" {
  type        = string
  description = "Description for the ALB security group"
}

/* --------------------------------- EKS SG --------------------------------- */
variable "eks_sg_name" {
  type = string
}

variable "eks_ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}
variable "eks_egress_rules" {
  description = "List of egress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "eks_sg_description" {
  type        = string
  description = "Description for the EKS security group"
}

