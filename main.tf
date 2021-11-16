resource "local_file" "pets" {
#  filename = var.filename[count.index]
  filename = each.value
  for_each = toset(var.filename)

  #  content         = "My favorite favoritee pet is ${random_pet.mypet.id} and its prefix is ${random_pet.mypet.prefix}"
  content         = "THe pet i have is a ${data.local_file.dog.content}"
  file_permission = "0600"
  depends_on      = [random_pet.mypet]
  #  lifecycle { create_before_destroy = true }
  #  lifecycle { prevent_destroy = true }
  #  lifecycle { ignore_changes = [content,] }
#  count = length(var.filename)
}

resource "random_pet" "mypet" {
  prefix    = var.prefix[0]
  separator = " "
  length    = var.length
}

data "local_file" "dog" {
  filename = "dog.txt"
}


resource "random_password" "password-generator" {
  length = var.length < 8 ? 8 : var.length
}

