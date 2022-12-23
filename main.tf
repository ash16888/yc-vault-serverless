## KMS
resource "yandex_kms_symmetric_key" "this" {
  name              = "kms-key"
  default_algorithm = "AES_256"
  rotation_period   = "8760h" # 1 year.
}
### Bucket
resource "yandex_storage_bucket" "vault" {
  bucket        = "vault-${var.yc_folder_id}"
  folder_id     = var.yc_folder_id
  access_key    = yandex_iam_service_account_static_access_key.this.access_key
  secret_key    = yandex_iam_service_account_static_access_key.this.secret_key
  force_destroy = true
}


## Serverless container
resource "yandex_serverless_container" "this" {
  name               = "vault"
  description        = "Serverless Vault"
  memory             = 256
  execution_timeout  = "15s"
  cores              = 1
  core_fraction      = 100
  service_account_id = yandex_iam_service_account.this.id
  image {
    url = "cr.yandex/crpdouee2epesrtliguv/vaultsls:1.9.4"
    environment = {
      AWS_S3_BUCKET          = yandex_storage_bucket.vault.bucket
      AWS_ACCESS_KEY_ID      = yandex_iam_service_account_static_access_key.this.access_key
      AWS_SECRET_ACCESS_KEY  = yandex_iam_service_account_static_access_key.this.secret_key
      YANDEXCLOUD_KMS_KEY_ID = yandex_kms_symmetric_key.this.id
    }
  }
}

