
class nginx {

  package  { 'nginx':
    ensure => present,
  }

  file { '/var/www/':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  file { '/etc/nginx/':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['openssh'],
    source  => 'puppet:///modules/ssh/sshd_config',
  }


file { '/etc/nginx/conf.d/default.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['openssh'],
    source  => 'puppet:///modules/ssh/sshd_config',
  }

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => File['/etc/ssh/sshd_config'],
  }

}
