data "aws_prefix_list" "s3-pl" {
  name = "com.amazonaws.*.s3"
}
