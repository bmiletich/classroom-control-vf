class skeleton {
    file { '/etc'
        ensure => directory,
    }
    file { '/etc/skel'
        ensure => directory,
    }
    
    file { '/etc/skel/.bashrc':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0440',
        source  => 'puppet:///modules/skeleton/bashrc',
    }   
}
