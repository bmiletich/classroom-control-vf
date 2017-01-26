class users::admins {
  $users = [ 'chen', 'jose' ]
  
  users::managed_user { $users: }
  
  users::managed_user { 'alice':
    group => 'admins',
  }
  
  group { 'admins':
    ensure => present,
  }
  
}
