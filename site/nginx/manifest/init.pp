
class nginx {

  $loc = '/etc/nginx',
  $site = '/var/www/'
  
  package { 'nginx':
    ensure => installed,
  }
  
  file { "{$loc}/nginx.conf":
    ensure => file,
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  
  file { '{$loc}/conf.d/default.conf':
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
  }
  
  file { "{$site}":
    ensure => directory,
  }
  
  file { "{$site}/index.html":
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }
}
