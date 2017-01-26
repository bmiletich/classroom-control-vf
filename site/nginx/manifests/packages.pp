class nginx::packages {

  #package { 'nginx':
  #  ensure => present,
  #}
  
  #package { 'nginx-filesystem':
  #  ensure => present,
  #}
  
  #package { 'nginx-mod-http-xslt-filter':
  #  ensure => present,
  #}

  #package { 'nginx-mod-http-geoip':
  #  ensure => present,
  #}

  #package { 'nginx-mod-stream':
  #  ensure => present,
  #}

  #package { 'nginx-mod-http-image-filter':
  #  ensure => present,
  #}

  #package { 'nginx-mod-http-perl':
  #  ensure => present,
  #}

  #package { 'nginx-mod-mail':
  #  ensure => present,
  #}
  
  #package { 'nginx-all-modules':
  #  ensure => present,
  #}

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
