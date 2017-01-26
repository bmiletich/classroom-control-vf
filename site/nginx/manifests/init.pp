class nginx {
  include nginx::packages
  include nginx::config
  include nginx::services
  
  $docroot  = '/var/www'
  $confdir  = '/etc/nginx'
  $blockdir = '/etc/nginx/conf.d'
  
  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
  }
  
  file { $docroot:
    ensure => directory,
  }
  
  file { 'index.html':
    path   => "${docroot}/index.html",
    source => 'puppet:///modules/nginx/index.html',
  }
}
