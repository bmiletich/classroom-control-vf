class users::admins {
  $users = ['alice', 'bob', 'joe' ]
  users::managed_user { $users: }
}
