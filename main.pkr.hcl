source "amazon-ebs" "amazon-example" {

  access_key    = var.access_key
  secret_key    = var.secret_key
  vpc_id        = var.vpc_id
  subnet_id     = var.subnet_id

  source_ami    = "ami-0a49b025fffbbdac6"
  region        = "eu-central-1"
  instance_type = "t2.micro"
  ssh_username  = "ubuntu"
  ami_name      = "ubuntu-{{timestamp}}"
}

build {
  sources = [
    "sources.amazon-ebs.amazon-example", 
  ]

 provisioner "shell" {
    script = "./scripts/install-nginx.sh"
  }
}

