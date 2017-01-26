class nginx::config {
  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
  }
  
  file { 'nginx.conf':
    path   => "${confdir}/nginx.conf",
    source => 'puppet:///modules/nginx/nginx.conf',
  }

  file { 'default.conf':
    path   => "${blockdir}/default.conf",
    source => 'puppet:///modules/nginx/default.conf',
  }
}
