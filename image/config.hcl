default_max_request_duration = "90s"
disable_clustering           = true
disable_mlock                = true
ui                           = true

listener "tcp" {
  address     = "0.0.0.0:8080"
  tls_disable = "true"
}

seal "yandexcloudkms" {
}

storage "s3" {
  endpoint ="https://storage.yandexcloud.net/"
  region = "ru-central1"
}
