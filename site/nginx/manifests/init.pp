class nginx {
  package { 'nginx':
    ensure => present,
    before => File['nginx.conf'],  
  }
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf',
    owner => 'root',
    group => 'root',
    notify => Service['nginx.conf'],
  }
  
  file { '/var/www':
    ensure => directory,
    path => '/var/www/',
    before => File['index.html'],

  }
  
  file { 'index.html':
    ensure => file,
    path => '/var/www/index.html',
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/nginx/index.html',
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => File['nginx.conf'],
  }
}
