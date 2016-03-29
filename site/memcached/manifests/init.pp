
class memcached {

## Manage the package
package { memcached :
    ensure =>present,
  }

## Manage the file
file { '/etc/sysconfig/memcached':
    ensure =>file,
  }

## Manage the service

}


