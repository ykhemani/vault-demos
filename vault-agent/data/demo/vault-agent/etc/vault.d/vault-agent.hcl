exit_after_auth = false

pid_file = "/data/demo/vault-agent/var/lib/pidfile"

vault {
  address = "https://vault.local:8200"
}

auto_auth {
  method "approle" {
    mount_path = "auth/approle-demo"
    config = {
      type = "approle"
      role = "my-role"
      role_id_file_path = "/data/demo/role_id"
      secret_id_file_path = "/data/demo/secret_id"
      bind_secret_id = false
    }
  }

  sink "file" {
    config = {
      path = "/data/demo/vault-token-via-agent"
    }
  }

}

cache {
  use_auto_auth_token = true
}

listener "tcp" {
  address = "127.0.0.1:8100"
  tls_disable = true
}

template {
  source      = "/data/demo/db/db_static.tpl"
  destination = "/var/demo/html/db_static.php"
  perms       = 0644
}

template {
  source      = "/data/demo/db/db_dynamic.tpl"
  destination = "/var/demo/html/db_dynamic.php"
  perms       = 0644
}

#template {
#  source      = "/data/demo/app/ssl/cert.tpl"
#  destination = "/data/demo/app/ssl/app.crt"
#}
#
#template {
#  source      = "/data/demo/app/ssl/ca.tpl"
#  destination = "/data/demo/app/ssl/ca.crt"
#}

#template {
#  source      = "/data/demo/app/ssl/key.tpl"
#  destination = "/data/demo/app/ssl/app.key"
#}
#
#template {
#  source      = "/data/demo/app/db/oracle.tpl"
#  destination = "/data/demo/app/db/oracle.sh"
#}
