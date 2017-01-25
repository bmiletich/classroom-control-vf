class httpd {

  File { '/etc/httpd/httpd.conf' :
    ensure => 'file',
    path => '/etc/httpd/httpd.conf',
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/httpd/httpd.conf'
    require => Package['httpd'],
    notify  => Service['httpd'],
  }
  Package { 'httpd' :
    ensure => 'present',
    before => File[httpd.conf]
  }

  Service { 'httpd' :
    enable => true,
  }

}
