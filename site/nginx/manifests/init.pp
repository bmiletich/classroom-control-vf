class nginx {
  package { 'nginx':
    ensure => present,
  }
  
  file { '/var/www':
    ensure => directory,
    owner => 'root',
    group => 'root',
  }

  file { 'index.html':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    path   => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html',
  }
  
#  file { 'nginx.conf':
#    ensure => file,
#    owner  => 'root',
#    group  => 'root',
#    path   => '/etc/nginx/nginx.conf',
#    source => 'puppet:///modules/nginx/nginx.conf',
#  }

#  file { 'default.conf':
#    ensure => file,
#    owner  => 'root',
#    group  => 'root',
#    path   => '/etc/nginx/conf.d/default.conf',
#    source => 'puppet:///modules/nginx/default.conf',
#  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
