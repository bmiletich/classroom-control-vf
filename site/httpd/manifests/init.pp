class httpd {

  Package { 'httpd' :
    ensure => 'present',
    before => File[httpd.conf]
  }

  Service { 'httpd' :
    enable => true,
  }

}
