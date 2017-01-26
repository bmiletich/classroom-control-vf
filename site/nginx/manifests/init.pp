class nginx{

  case $::osfamily{
	  'redhat','debian':{
		  $package = 'nginx'
		  $owner = 'root'
		  $group = 'root'
		  $docroot = '/var/www'
		  $confdir = '/etc/nginx'
		  $logdir = '/var/log/nginx'
		  }
	  default:{
		  fail("Module ${module_name} is not supported on ${::osfamily}")
		  }
	  }

  package {$package:
    ensure => present,
  }

  File {
    ensure => file,
    owner => $owner,
    group => $group,
    mode => '0644',
  }
  file {'/etc/nginx/nginx.conf':
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  
  file {[$docroot, "${confdir}/conf.d"']:
    ensure => directory,
  }
  
  file {"${confdir}/nginx.conf":
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
   
  file {"${docroot}/index.html":
    source => 'puppet:///modules/nginx/index.html',
    require => Package['nginx'],
  }

  service { 'nginx':
    ensure => 'running',
    enable => true,
    subscribe => File['/etc/nginx/nginx.conf'],
  }
}
