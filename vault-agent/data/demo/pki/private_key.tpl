{{ with secret "pki-int-seva-cafe/issue/seva-cafe" "common_name=demo.seva.cafe" }}
{{ .Data.private_key }}
{{ end }}
