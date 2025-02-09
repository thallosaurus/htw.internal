resource "docker_image" "kuma" {
  name          = "louislam/uptime-kuma"
}

resource "docker_container" "kuma" {
  name  = "uptime-kuma"
  image = docker_image.kuma.image_id
  ports {
    internal = 3001
    external = 3001
  }
}
