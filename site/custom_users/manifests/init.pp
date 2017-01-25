class custom_users_test {

  user { 'fundamentals':
	  ensure => present,
    password_max_age => '99999',
    }
}
