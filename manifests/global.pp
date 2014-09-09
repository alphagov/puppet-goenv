# == Class: goenv::global
#
# Set a Go version as the global. This is intended to be called by the
# parent `Goenv` class. It should not be called directly.
#
# === Parameters:
#
class goenv::global {
  include goenv::params

  $version = $::goenv::global_version

  if $version {
    file { $goenv::params::global_version:
      ensure  => present,
      content => "${version}\n",
      require => Goenv::Version[$version],
    }
  } else {
    file { $goenv::params::global_version:
      ensure => absent,
    }
  }
}
