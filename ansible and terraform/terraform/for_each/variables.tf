variable "filename" {
type = set(string)
default = [
"/tmp/pets.txt",
"/tmp/dogs.txt",
"/tmp/cats.txt" ,
"/tmp/cows.txt",
"/tmp/ducks.txt"
]
}
variable "content" {
default = "Hello"
}
