# == Define: goenv::rehash
#
# Run `goenv rehash` for a specific version of Go. Typically refreshed by
# `Goenv::Version[]` after installation.
#
# The title of the resource is used as the version.
#
# NB: Exec[] resources do not assume that goenv has been initialised from
# `profile.d` because Puppet may be running from a non-login and
# non-interactive shell (e.g. cron). They explicitly pass `GOENV_ROOT` and
# GOENV_VERSION for this reason.
#
# TODO: Does this need to be version specific?
#
define goenv::rehash() {
  include goenv::params

  $version = $title

  exec { "goenv rehash for ${version}":
    command     => "${goenv::params::goenv_binary} rehash",
    environment => [
      "GOENV_ROOT=${goenv::params::goenv_root}",
      "GOENV_VERSION=${version}",
    ],
    refreshonly => true,
  }
}
