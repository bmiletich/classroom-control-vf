class nginx {
  package { 'nginx':
    ensure => present,
    before => File['nginx.conf']  
  }
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf',
    owner => 'root',
    group => 'root',
    notify => Service['nginx.conf'],
  }
  
  service { 'nginx':
    ensure => running,
    enabled => true,
    subscribe => File['nginx.conf'],
  }
}
