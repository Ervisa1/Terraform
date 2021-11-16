variable "filename" {
  default     = "my_pet.txt"
  type        = string
  description = "this is the name of the file i am going to create"
}

variable "length" {
  default     = "1"
  type        = number
  description = "This is the length of the name of our pet"
}

variable "favorite" {
  default     = true
  type        = bool
  description = "This is my favor pet"
}

#complex type of variables
variable "prefix" {
  default = ["Mrs.", "Mr"]
  type    = list(string)
}


variable "cat" {
  type = tuple([string, number, bool])
  default = ["catty",
    8,
  true]
}

#variable map
variable "file-content" {
  type = map(any)
  default = {
    "pet1" = "Dog",
    "pet2" = "Cat"
  }
}

variable "jerry" {
  type = object({
    name         = string
    color        = string
    food         = list(string)
    favorite_pet = bool
  })
  default = {
    name         = "jerry"
    color        = "black"
    food         = ["grain", "vegetables"]
    favorite_pet = true
  }
  description = "My pet is jerry with the above spec"
}
