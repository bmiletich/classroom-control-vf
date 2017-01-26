class user {
user { 'fundamental' :
  ensure => 'present',
  }
class managed_user {
user { 'fundamental' :
  home  =>  '/home/fun',
  owner =>  'fundamental',
  group =>  'fundamental',

}
}

}



