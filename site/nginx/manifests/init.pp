class nginx{

  file{'filename':
  }

  service{'nginx':
    ensure => running,
    enable => true
  }

  package{'nginx':
    ensure => test,
  }

}
