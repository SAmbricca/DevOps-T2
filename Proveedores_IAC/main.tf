#Archivo de configuración de Terraform para desplegar una instancia EC2 en AWS

#Configuración del proveedor AWS

provider "aws" {
region = "us-east-1"  # Cambia esto a la regi¾n deseada
}

#Crear un nuevo grupo de seguridad

resource "aws_security_group" "instance_security_group" {
name        = "instance_security_group_2"
description = "Security group for EC2 instance"
}
#Definición de la instancia EC2

resource "aws_instance" "PROVEEDORES_dev_instance" {
ami           = "ami-0a3c3a20c09d6f377"  # AMI de Amazon Linux
instance_type = "t2.micro"               # Tipo de instancia

#Asociar la instancia con el grupo de seguridad recién creado

vpc_security_group_ids = [aws_security_group.instance_security_group.id]

#Tag para identificar la instancia

tags = {
Name = "ORG-PROVEEDORES-DEV"
}
}

#Salida para mostrar la IP pública de la instancia EC2 después del despliegue

output "public_ip_dev" {
value = aws_instance. PROVEEDORES_dev_instance.public_ip
}
