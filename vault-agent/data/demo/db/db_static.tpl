{{ with secret "kv/mysql/qotd" }}
<?php
  // db connection parameters
  define('DB_DATABASE', 'qotd');
  define('DB_HOST', '127.0.0.1');
  define('DB_USER', '{{ .Data.data.username }}');
  define('DB_PASSWORD', '{{ .Data.data.password }}');

  // connect to mysql server and select db
  $link = new mysqli(DB_HOST, DB_USER, DB_PASSWORD,DB_DATABASE);
  if (mysqli_connect_errno())
  {
    $error = 'Failed to connect to database server: ' . mysqli_connect_error();
    error_log($error);
    print '<pre>$error</pre>';
    exit;
  }
?>
{{ end }}
