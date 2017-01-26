class nginx {
  package { 'nginx':
    ensure => present,
  }
  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
  }
  file { '/var/www':
    ensure => directory,
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
