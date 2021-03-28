provider "yandex" {
  token     = "AgAAAAALhKNkAATuwSWNphbV3kAeiJre_rcUVpQ"
  cloud_id  = "b1gev2mjr941ob98i4s0"
  folder_id = "b1ghqdns0prbiq4bjtld"
  zone      = "ru-central1-b"
}
resource "yandex_compute_instance" "app" {
  name = "reddit-app"

metadata = {
  ssh-keys = "ubuntu:${file("~/.ssh/appuser.pub")}"
  }

  resources {
    cores  = 2
    memory = 2
    
}



  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = "fd8bl8m71k38ju92ivja"
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-b
    subnet_id = "e2l0tjopgt4kfgghrl2n"
    nat       = true
  }

connection {
  type = "ssh"
  host = yandex_compute_instance.app.network_interface.0.nat_ip_address
  user = "ubuntu"
  agent = false
  # путь до приватного ключа
  private_key = file("~/.ssh/appuser")
  }

provisioner "file" {
  source = "files/puma.service"
  destination = "/tmp/puma.service"
}

provisioner "remote-exec" {
  script = "files/deploy.sh"
}

}
