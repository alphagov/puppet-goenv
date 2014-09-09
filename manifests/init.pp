# == Class: goenv
#
# Install goenv from a system package and create an `/etc/profile.d` to do
# the following for all new shell sessions:
#
# - Set `GOENT_ROOT` to a common system path.
# - Run `goenv init`.
#
# === Parameters:
#
# [*global_version*]
#   Version to use. A matching `Goenv::Version[]` resource must exist if
#   specified.
#   Default: undef
#
class goenv(
  $global_version = undef
) {
  include goenv::params

  package { 'goenv':
    ensure => latest,
  } ->
  file { '/etc/profile.d/goenv.sh':
    ensure  => present,
    mode    => '0755',
    content => template('goenv/etc/profile.d/goenv.sh.erb'),
  } ->
  class { 'goenv::global': }
}
