class postfix::install {
  package { [$postfix::params::package, $postfix::params::packages_extra]:
    ensure => $postfix::package_ensure,
  }
}
