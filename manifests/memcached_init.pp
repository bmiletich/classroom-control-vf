class memcached {

  package {'memcached':
  ensure => present,
  before => File['memcached'],
  }
  
  file { 'memcached':
    ensure => file,
    path => 'etc/sysconfig/memcached',
    owner => 'root',
    group => 'root',
    notify => Service['memcached'],
  }
  
  service {'memcached':
    ensure => running,
    enable => true,
    subscribe => File['memcached'],
    }
}

