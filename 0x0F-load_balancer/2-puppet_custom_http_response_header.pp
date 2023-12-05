# installs nginx server and set HTTP header

exec {'updates':
  provider => shell,
  command  => 'sudo apt update',
  before   => Exec['install nginx'],
}

exec {'install nginx':
  provider => shell,
  command  => 'sudo apt install nginx -y',
  before   => Exec['add header'],
}

exec {'add header':
  provider => shell,
  environment => ["HOSTNAME=${hostname}"],
  command     => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOSTNAME\";/" /etc/nginx/nginx.conf',
  before => Exec['restart nginx'],
}

exec {'restart nginx':
  provider => shell,
  command => 'sudo service nginx restart',
}