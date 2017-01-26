class nginx {
  package { 'nginx':
    ensure => present,
  }
 $docroot = '/var/www'
  
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
  
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
