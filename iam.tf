resource "yandex_iam_service_account" "this" {
  folder_id = var.yc_folder_id
  name      = "vault-${var.yc_folder_id}"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-puller" {
  folder_id = var.yc_folder_id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${yandex_iam_service_account.this.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-kms" {
  folder_id = var.yc_folder_id
  role      = "kms.keys.encrypterDecrypter"
  member    = "serviceAccount:${yandex_iam_service_account.this.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-admin" {
  folder_id = var.yc_folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.this.id}"
}

resource "yandex_iam_service_account_static_access_key" "this" {
  service_account_id = yandex_iam_service_account.this.id
  description        = "Static access key for object storage"
}
