class nginx::params {
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
}
