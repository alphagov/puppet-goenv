# == Class: goenv::params
#
# Common variables referred to by other sub-classes.
#
class goenv::params {
  case $::osfamily {
    'Debian': {
      $goenv_root     = '/usr/lib/goenv'
      $goenv_binary   = '/usr/bin/goenv'
      $global_version = "${goenv_root}/version"
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
