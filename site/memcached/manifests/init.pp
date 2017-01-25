class memcached {
    ensure => present,
    }
    
    file { '/etc/sysconfig/memcached' :
        ensure => file,
        owner => 'root',
        source => 'puppet:///modules/memcached/memcached',
        require => Package['memcached'],
        
        }
        
    service { 'memcachd':
        ensure => running,
        enable => true,
        subscribe => File['/etc/sysconfig/memcachd'],
        }
    }
