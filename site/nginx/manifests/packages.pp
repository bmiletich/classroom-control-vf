class nginx::packages {
  $package = [ 
    'nginx',
    'nginx-filesystem',
    'nginx-mod-http-xslt-filter',
    'nginx-mod-http-geoip',
    'nginx-mod-stream',
    'nginx-mod-http-image-filter',
    'nginx-mod-http-perl',
    'nginx-mod-mail',
    'nginx-all-modules'
  ]

  package { $package:
    ensure => present,
  }

}
