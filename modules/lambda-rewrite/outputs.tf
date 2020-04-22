output "lambda_arn" {
  value = "${aws_lambda_function.rewrite.arn}:${element(concat(aws_lambda_function.rewrite.*.version, list("")),0)}"
}
