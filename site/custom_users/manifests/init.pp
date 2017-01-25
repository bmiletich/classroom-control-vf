class custom_users {

  user { 'fundamentals':
	  ensure => present,
    password_max_age => '99999',
    }
}
