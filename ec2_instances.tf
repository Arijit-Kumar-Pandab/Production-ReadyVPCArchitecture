# data "aws_ami" "ubuntu_ami" {
#   most_recent = true
#   owners = ["099720109477"]

#   filter {
#     name = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }
# }

# resource "aws_instance" "bastion_host" {
#     ami = data.aws_ami.ubuntu_ami.id
#     instance_type = "t3.micro"
#     subnet_id = aws_subnet.public_subnet.id
#     key_name = aws_key_pair.main.key_name
#     security_groups = [aws_security_group.bastion_sg.id]
#     associate_public_ip_address = true
#     tags = {
#         Name = "bastion-host"
#     }
# }

# resource "aws_instance" "web_server" {
#     ami = data.aws_ami.ubuntu_ami.id
#     instance_type = "t3.micro"
#     subnet_id = aws_subnet.private_subnet.id
#     key_name = aws_key_pair.main.key_name
#     security_groups = [aws_security_group.ec2_sg.id]
#     tags = {
#         Name = "web-server"
#     }
# }

