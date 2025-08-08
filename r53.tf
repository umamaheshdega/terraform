resource "aws_route53_record" "expense" {
<<<<<<< HEAD
  count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip] #list type
  allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[2].public_ip] #list type
=======
  for_each = aws_instance.this
  zone_id = var.zone_id
  name    = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
>>>>>>> e2741ca (for_each)
  allow_overwrite = true
}