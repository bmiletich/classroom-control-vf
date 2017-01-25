class memchached {
file { 'memchached': 
    ensure  => file, 
    path  => '/etc/sysconfig/memchached',
    owner   => 'root',  
    group   => 'root',  
    mode    => '0644',  
    source  => 'puppet:///modules/memchached/memcached',  
    require => Package['memchached'],
    notify => Service['memchached'],
  }
  package { 'memcached':  
    ensure => present,
    before => File['memchached'],
  }
  service { 'memcached':  
      ensure    => running,
      enable    => true,
     }
  }
