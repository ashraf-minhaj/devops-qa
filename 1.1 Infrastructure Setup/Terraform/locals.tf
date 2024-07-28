locals {
  ec2_sg_name = "${var.component_prefix}-lbsg-${var.component_postfix}"
  db_sg_name  = "${var.component_prefix}-rdssg-${var.component_postfix}"
  vpc_name    = "${var.component_prefix}-${var.vpc}-${var.component_postfix}"
  igw_name    = "${var.component_prefix}-igw-${var.component_postfix}"
  pub_rt_name = "${var.component_prefix}-pubrt-${var.component_postfix}"
  db_sub_grp  = "${var.component_prefix}-dbsubgrp-${var.component_postfix}"
  db_name     = "${var.component_prefix}-postgres-${var.component_postfix}"
  ec2_name    = "${var.component_prefix}-instance-${var.component_postfix}"
}