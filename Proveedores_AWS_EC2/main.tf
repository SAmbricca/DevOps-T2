provider "aws" {
region = "us-east-1" 
}

#Creo un nuevo grupo de seguridad

resource "aws_security_group" "instance_security_group" {
name        = "instance_security_group"
description = "Security group for EC2 instance"
}

resource "aws_instance" "PROVEEDORES_dev_instance" {
ami           = "ami-0a3c3a20c09d6f377"  
instance_type = "t2.micro"               

#Asocio la instancia con el grupo de seguridad creado

vpc_security_group_ids = [aws_security_group.instance_security_group.id]

#Tag para identificar la instancia

tags = {
Name = "ORG-PROVEEDORES-DEV"
}
}

#Salida para mostrar la IP publica de la instancia EC2 despues del despliegue

output "public_ip_dev" {
value = aws_instance. PROVEEDORES_dev_instance.public_ip
}
