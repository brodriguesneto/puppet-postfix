class postfix::params {
  case $::operatingsystem {
    'Ubuntu' : {
      case $::lsbdistrelease {
        /(12.04|14.04)/ : {
          $package        = 'postfix'
          $packages_extra = 'mailutils'
          $service        = 'postfix'
          $postfix_master = '/etc/postfix/master.cf'
          $postfix_main   = '/etc/postfix/main.cf'
        }
        default         : {
          case $::lsbdistrelease {
            default : { fail("Unsupported Ubuntu suite: ${::lsbdistrelease}") }
          }
        }
      }
    }
    default  : {
      case $::operatingsystem {
        default : { fail("Unsupported operating system: ${::operatingsystem}") }
      }
    }
  }
}
