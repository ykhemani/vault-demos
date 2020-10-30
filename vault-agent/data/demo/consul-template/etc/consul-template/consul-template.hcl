# This is the signal to listen for to trigger a reload event. The default
# value is shown below. Setting this value to the empty string will cause CT
# to not listen for any reload signals.
reload_signal = "SIGHUP"

# This is the signal to listen for to trigger a graceful stop. The default
# value is shown below. Setting this value to the empty string will cause CT
# to not listen for any graceful stop signals.
kill_signal = "SIGINT"

pid_file = "/data/demo/consul-template/var/lib/pidfile"

vault {
  address = "https://vault.local:8200"

  # namespace = "ns1"

  vault_agent_token_file = "/data/demo/vault-token-via-agent"

  renew_token = false
}

template {
  source      = "/data/demo/pki/certificate.tpl"
  destination = "/data/demo/pki/certificate.pem"
  perms       = 0644
  command     = "/data/demo/restart_script"
}

template {
  source      = "/data/demo/pki/ca_chain.tpl"
  destination = "/data/demo/pki/ca_chain.pem"
  perms       = 0644
  command     = "/data/demo/restart_script"
}

template {
  source      = "/data/demo/pki/issuing_ca.tpl"
  destination = "/data/demo/pki/issuing_ca.pem"
  perms       = 0644
  command     = "/data/demo/restart_script"
}

template {
  source      = "/data/demo/pki/private_key.tpl"
  destination = "/data/demo/pki/private_key.pem"
  perms       = 0600
  command     = "/data/demo/restart_script"
}

template {
  source      = "/data/demo/pki/expiration.tpl"
  destination = "/data/demo/pki/expiration"
  perms       = 0644
  command     = "/data/demo/restart_script"
}

