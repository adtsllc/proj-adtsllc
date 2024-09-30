
resource "aws_instance" "jenkins_server" {
  ami = "i-0958d360728f11f13"
  instance_type = "t2.micro"
  tags = {
    Name = "Jenkins_server"
  }
}