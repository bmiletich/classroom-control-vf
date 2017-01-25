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



  file{ '/etc/skel':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }
  
  file{ '/etc/skel/.bashrc':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source  => 'puppet:///modules/skeleton/bashrc',
  }
