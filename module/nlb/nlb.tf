resource "aws_lb" "nlb" {
  name               = local.nlb_name
  load_balancer_type = "network"
  subnets            = var.subnet_id_list
}

resource "aws_lb_target_group" "tg" {
  name = local.tg_name

  # network
  vpc_id      = var.vpc_id
  target_type = "ip"
  protocol    = "TCP"
  port        = 80

  # hc
  health_check {
    protocol = "TCP"
    port     = "traffic-port"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.nlb.arn
  protocol          = "TCP"
  port              = 80

  # default
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
