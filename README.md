# Yandex Cloud Serverless Vault KMS AutoUnseal

Для создания Serverless контейенера нам понадобится кастомный образ Hashicorp Vault от Yandex Cloud
https://cloud.yandex.ru/marketplace/products/f2eokige6vtlf94uvgs2

Добавим конфиг в котором прописан   Object Storage (S3) в качестве бэкенда, и unseal с помощью Yandex KMS.
Собираем образ и пушим его в Container Registry. 

Или используем уже готовый образ.

### Terraform

Локально переименовываем файл private.auto.tfvars.example в private.auto.tfvars
добавляем свои данные.

Затем стандартно ...
```
terraform init

terraform plan

terraform apply
```

В веб консоли Yandex Cloud включаем публичную ссылку для нашего Serverless контейенера

Переходим по ссылке и попадаем в веб интерфейс Vault и получаем ключи для unseal root token
которые следует сохранить.

Дополнительно можно скачать бинарник Vault
и работать с Serverless Vault локально используя переменые окружения
```
export VAULT_ADDR= <Ссылка для вызова>
export VAULT_TOKEN= < token > 
```
