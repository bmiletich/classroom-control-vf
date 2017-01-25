class memcached{
  package{ 'memcached':
    ensure => present,
  }  
  file{ '/etc/sysconfig/memcached':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
    before => File['memcached']
  }
  
  file{ 'memcached':
    ensure => file,
    path => '/etc/sysconfig/memcached',
    owner => 'root',
    group => 'root',
    mode => '0644',
    source  => 'puppet:///modules/memcached/memcached',
    notify => Service['memcached']
    
  service { 'memcached':
    ensure    => running,
    enable    => true,
  }

}


  
  
  }
