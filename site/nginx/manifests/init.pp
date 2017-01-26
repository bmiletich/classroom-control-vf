class nginx {
  include nginx::packages
  include nginx::config
  include nginx::services
  
  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
  }
  
  file { '/var/www':
    ensure => directory,
  }
  
  file { 'index.html':
    path   => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html',
  }
}
