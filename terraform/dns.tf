resource "powerdns_zone" "test" {
  name        = "apps.htw.internal."
  kind        = "Native"
  nameservers = ["ns1.tf-test.htw.internal."]
}

resource "powerdns_record" "macmini_dns" {
  zone = "home.htw.internal"
  #zone    = "tf-test.htw.internal."
  name    = "macmini.home.htw.internal."
  type    = "A"
  ttl     = 300
  records = ["10.69.0.16"]
}

resource "powerdns_record" "name" {
  zone = "home.htw.internal"
  name = "switch.home.htw.internal."
  type = "A"
  ttl = 300
  records = ["10.69.0.5"]
}

resource "powerdns_record" "wifidrone" {
  zone = "home.htw.internal"
  name = "wifidrone.home.htw.internal."
  type = "A"
  ttl = 300
  records = ["10.69.0.6"]
}

resource "powerdns_record" "apps_dns" {
  zone = "htw.internal"
  name = "apps.htw.internal."
  type = "A"
  ttl = 300
  records = ["10.0.0.103"]
}