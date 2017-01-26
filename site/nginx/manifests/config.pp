class nginx::config {
  
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
    content => epp('nginx/default.conf.epp' {
      docroot => $docroot,
    }),
  }
}
