# Class: postfix
class postfix ($ensure = 'present', $autoupgrade = false, $relayhost = 'smtp.google.com') inherits postfix::params {
  case $ensure {
    /(present)/ : {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/  : {
      $package_ensure = 'absent'
    }
    default     : {
      fail('ensure parameter must be present or absent')
    }
  }
  include postfix::install, postfix::config, postfix::service
  Class['postfix::install'] -> Class['postfix::config'] ~> Class['postfix::service']
}
