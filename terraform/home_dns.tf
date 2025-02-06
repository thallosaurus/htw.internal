resource "powerdns_zone" "test" {
  name        = "tf-test.htw.internal."
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