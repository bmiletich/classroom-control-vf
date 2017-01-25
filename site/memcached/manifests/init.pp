# Lab 11.1
class memcahced {
   package { 'memcahced':
      ensure => present,
      )
    file { '/etc/sysconfig/memcached':
      ensure => file,
      owner => 'root',
      group => 'root',
      source => 'puppet:///modules/memcached/memcached', 
      }
    
    service { 'memcached':
       ensure => running,
       enable => true,
       subscribe => File['/etc/sysconfig/memcahced'],
       }
}
