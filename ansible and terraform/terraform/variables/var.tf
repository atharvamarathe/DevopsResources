variable "filename" {
default = "/tmp/pets.txt"
type = string
description = "Filename to be generated for tracking pets"
}
variable "content" {
default = "We love pets!"
}
variable "prefix" {
default = "Mrs"
}
variable "separator" {
default = "."
}
variable "length" {
default = "1"
}
