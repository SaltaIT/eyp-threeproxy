class threeproxy(
                  $manage_package        = true,
                  $package_ensure        = 'installed',
                  $manage_service        = true,
                  $manage_docker_service = true,
                  $service_ensure        = 'running',
                  $service_enable        = true,
                  $nserver               = [],
                  $listen                = '127.0.0.1',
                  $bind                  = '0.0.0.0',
                  $port                  = '3128',
                  $anonymous             = false,
                  $upstream_proxy_ip     = undef,
                  $upstream_proxy_port   = '3128',
                ) inherits threeproxy::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::threeproxy::install': }
  -> class { '::threeproxy::config': }
  ~> class { '::threeproxy::service': }
  -> Class['::threeproxy']

}
