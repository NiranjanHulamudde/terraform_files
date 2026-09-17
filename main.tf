# look up latest ubuntu image dynamically

data "aws_ami" "ubuntu" {
	most_recent	= true
	filter  {
		name	= "name"
		values	= ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
}
	owners	= ["099720109477"]  # Canonical id - paste as it is
}

# Create the virtual server using the variables previously assigned

resource "aws_instance" "app_server" {
	ami 	= data.aws_ami.ubuntu.id
	instance_type	= var.instance_type

	key_name = "awskey"	# Tells aws to use these key for ssh authentication

	tags = 	{
	Name	= var.server_name
}
}
