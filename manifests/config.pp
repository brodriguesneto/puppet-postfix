class postfix::config {
  File {
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { $postfix::params::postfix_master:
    content => template("${module_name}/master.cf.erb"),
    require => Package[$postfix::params::package],
    notify  => Service[$postfix::params::service],
  }

  file { $postfix::params::postfix_main:
    content => template("${module_name}/main.cf.erb"),
    require => Package[$postfix::params::package],
    notify  => Service[$postfix::params::service],
  }
}
