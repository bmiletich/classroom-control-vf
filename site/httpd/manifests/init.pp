class httpd {

  Package { 'httpd' :
    ensure => 'present',
  }

  Service { 'httpd' :
    enable => true,
  }

}
