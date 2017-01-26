class nginx (
  $docroot  = $nginx::params::docroot,
  $confdir  = $nginx::params::confdir,
  $blockdir = $nginx::params::blockdir,
  $logdir   = $nginx::params::logdir,
  $owner    = $nginx::params::owner,
  $group    = $nginx::params::group,
  ) inherits nginx::params
  {
  include nginx::packages
  #include nginx::config
  include nginx::services
  

  File {
    ensure => file,
    owner  => $owner,
    group  => $group,
    mode   => '0664',
  }
  
  file { $docroot:
    ensure => directory,
  }
  
  file { 'index.html':
    path   => "${docroot}/index.html",
    source => 'puppet:///modules/nginx/index.html',
  }
  
  file { 'nginx.conf':
    path    => "${confdir}/nginx.conf",
    content => epp('nginx/nginx.conf.epp', {
      confdir  => $confdir,
      blockdir => $blockdir,
      logdir   => $logdir,
      user     => $user,
    }),
  }

  file { 'default.conf':
    path    => "${blockdir}/default.conf",
    content => epp('nginx/default.conf.epp', {
      docroot => $docroot,
    }),
  }

}
