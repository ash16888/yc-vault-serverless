FROM cr.yandex/yc-marketplace/hashicorp/vault/vault:1.8.2_yckms
COPY ./config.hcl  /vault/config/
ENTRYPOINT ["vault", "server", "-config", "/vault/config/config.hcl"]
