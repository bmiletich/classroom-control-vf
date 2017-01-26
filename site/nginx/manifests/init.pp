class nginx {
  include nginx::packages
  #include nginx::config
  include nginx::services
  
  case $::os['family'] {
    'redhat' : {
      $docroot  = '/var/www'
      $confdir  = '/etc/nginx'
      $blockdir = '/etc/nginx/conf.d'
      $logdir   = '/var/log/nginx'
      $owner    = 'root'
      $group    = 'root'
    }
    default : { fail("Unsupported ${module_name} for this ${::os['family']}!") }
  }
  
  $user = $::os['family'] ? {
    'redhat' => 'nginx',
    default  => 'nginx',
  }
  
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
      confdir => $confdir,
      logdir  => $logdir,
      user    => $user,
    }),
  }

  file { 'default.conf':
    path    => "${blockdir}/default.conf",
    content => epp('nginx/default.conf.epp', {
      docroot => $docroot,
    }),
  }

}
