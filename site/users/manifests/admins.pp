class users::admins {
  $users = [ 'alice', 'chen', 'jose' ]
  
  users::managed_user { $users: }
  
}
