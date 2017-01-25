class nginx::services {
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
