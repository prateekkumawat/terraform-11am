output "instnace_public_ip" {
    value = aws_instance.this1newpubins.public_ip
}
output "instance_private_ip" {
  value = aws_instance.this1newpubins.private_ip
}
output "instnace_image_name" {
  value = aws_instance.this1newpubins.ami
}
output "instnace_id" {
  value = aws_instance.this1newpubins.id
}
output "instance2_private_ip" {
  value = aws_instance.this1newprivins.private_ip
}