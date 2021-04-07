resource "yandex_compute_instance" "db" {
  name = "reddit-db"

  resources {
    cores  = 2
    memory = 2
    
}

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-b
    subnet_id = var.subnet_id
    #subnet_id = yandex_vpc_subnet.app-subnet.id
    nat       = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

# connection {
#   type = "ssh"
#   host = yandex_compute_instance.db.network_interface.0.nat_ip_address
#   user = "ubuntu"
#   agent = false
#   # путь до приватного ключа
#   private_key = file(var.privat_key_path)
#   }

# provisioner "file" {
#   source = "files/puma.service"
#   destination = "/tmp/puma.service"
# }

# provisioner "remote-exec" {
#   script = "files/deploy.sh"
# }

}
