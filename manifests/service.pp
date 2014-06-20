class postfix::service {
  service { $postfix::params::service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['postfix::config'],
  }
}
