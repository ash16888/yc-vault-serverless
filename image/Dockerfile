FROM cr.yandex/yc-marketplace/yandex-cloud/vault/vault:1.1.5_yckms
COPY ./config.hcl  /vault/config/
ENTRYPOINT ["vault", "server", "-config", "/vault/config/config.hcl"]
