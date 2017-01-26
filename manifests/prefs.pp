class nginx::params {
  case $::osfamily {
  'redhat','debian' : {
	$package = 'nginx'
	$owner   = 'root'
	$group   = 'root'
	$docroot = '/var/www'
	$confdir = '/etc/nginx'
	$logdir  = '/var/log/nginx'
	}
	default: {
		fail("Module ${module_name} is not supported on ${::osfamily}")
		}
	}  
	$user = $::osfamily ? {
		'redhat'  => 'nginx',
		'debian'  => 'www-data',
		'windows' => 'nobody',
		}
	$port = '80' 
}
