provider "aws" {
   region  = "eu-west-1"
   profile = "default" 
}

resource "aws_instance" "k6"{
      ami = var.image_id
      instance_type = var.instance_type
      security_groups = var.security_groups
      key_name = var.key_name
      tags = {
            Name = "K6"
      }
}

resource "null_resource" "remote"{
  connection {
    type        = "ssh"
    user        = var.instance_user
    host        = aws_instance.k6.public_ip
    private_key = file(var.private_key_location)
    timeout     = "1m"
  }

  provisioner "file" {
    source      = "./k6/script.js"
    destination = "/tmp/k6-script.js"
  }
  
  provisioner "remote-exec" {
         inline = [
                    "sudo gpg -k",
                    "sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69",
                    "echo 'deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main' | sudo tee /etc/apt/sources.list.d/k6.list",
                    "sudo apt-get -y update",
                    "sudo apt-get -y install k6",
                    "k6 run --out json=/tmp/k6_result.json /tmp/k6-script.js"
                  ]
  }
  depends_on = [
    aws_instance.k6,
  ]
}