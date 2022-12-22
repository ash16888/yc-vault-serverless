FROM cr.yandex/yc-marketplace/yandex-cloud/vault/vault:1.9.4_yckms
COPY ./config.hcl  /vault/config/
ENTRYPOINT ["vault", "server", "-config", "/vault/config/config.hcl"]
