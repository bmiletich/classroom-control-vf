class nginx{

  package {'nginx':
    ensure => present,
  }

  file {'/usr/local/nginx/conf/nginx.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
  }

  service { 'nginx':
    ensure => 'running',
    enable => true,
    subscribe => File['/usr/local/nginx/conf/nginx.conf'],
  }
}
