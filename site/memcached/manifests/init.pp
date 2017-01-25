class memcached{
  package{ 'memcached':
  }
  file{ '/etc/sysconfig/memcached':
  }
  service{ 'memcached':
  }

}
