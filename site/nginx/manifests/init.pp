class nginx {
  package { 'nginx':
    ensure => present,
    before => File['nginx.conf'],  
  }
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf',
    owner => 'nginx',
    group => 'nginx',
    notify => Service['nginx'],
    before => Service['nginx'],
  }
  file { 'default.conf':
    ensure => file,
    path => '/etc/nginx/default.conf',
    owner => 'nginx',
    group => 'nginx',
    source => 'puppet:///modules/nginx/default.conf',
  }
  
  file { '/var/www':
    ensure => directory,
    path => '/var/www/',
    owner => 'nginx',
    group => 'nginx',
    before => File['index.html'],
  }
  
  file { 'index.html':
    ensure => file,
    path => '/var/www/index.html',
    owner => 'nginx',
    group => 'nginx',
    source => 'puppet:///modules/nginx/index.html',
  }

  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => File['nginx.conf'],
  }
}
