class { 'nginx':
  package { 'nginx':
  }
  file { 'documentroot':
    package => 'nginx',
    docroot => '/var/www',
    configfile => '/etc/nginx/nginx.conf',
    serverblock => '/etc/nginx/conf.d/default.conf'
  }
  file { 'index.html':
  }
  file { 'configurenginx':
  }
  service { 'nginx':
  }
}
