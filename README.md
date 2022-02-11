# Yandex Cloud Serverless Vault KMS AutoUnseal

Для создания нам понадобится кастомный образ Hashicorp Vault от Yandex Cloud
https://cloud.yandex.ru/marketplace/products/f2eokige6vtlf94uvgs2

Добавим конфиг в котором прописан   Object Storage (S3) в качестве бэкенда, и unseal с помощью Yandex KMS.
Собираем образ и пушим его в Container Registry.

ПОДГОТОВКА

Создаем бакет

Создаем ключ KMS

Сервисный аккаунт с ролями:

- storage.editor
- kms.keys.encrypterDecrypter
- container-registry.images.puller
 
В сервисном аккауте создаем статический  ключ доступа  


Создаем Serverless Container

включаем публичную ссылку

VCPU 1

RAM 256 Mb

Сервисный аккаунт с ролями: 
storage.editor kms.keys.encrypterDecrypter container-registry.images.puller


Добавляем контейнеру переменнные окружения

AWS_S3_BUCKET  название созданного бакета

AWS_ACCESS_KEY_ID статический  ключ доступа  

AWS_SECRET_ACCESS_KEY статический  ключ доступа  

YANDEXCLOUD_KMS_KEY_ID   ключ kms

Создаем ревизию после того как она перейдет в состояние active.

Переходим по ссылке и попадаем в веб интерфейс Vault и получаем ключи для unseal root token
которые следует сохранить.

Дополнительно можно скачав бинарник Vault
и работать с Serverless Vault локально используя переменую окружения
export VAULT_ADDR= <Ссылка для вызова>
