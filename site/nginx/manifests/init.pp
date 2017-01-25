class nginx {
  package { 'nginx':
    ensure => present,
  }
  
  file { '/var/www':
    ensure => directory,
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
