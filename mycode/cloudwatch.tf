
resource "aws_cloudwatch_log_group" "awa" {
  name = "awa"

  tags = {
    Environment = "deve"
    Application = "cooperA"
  }
}