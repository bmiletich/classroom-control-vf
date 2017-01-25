class { 'nginx':
  package { 'nginx':
  }
  file { 'documentroot':
  }
  file { 'index.html':
  }
  file { 'configurenginx':
  }
  service { 'nginx':
  }
}
