# == Class: goenv::version
#
# Install a version of Go under goenv from a system package.
#
# The title of the resource is used as the version.
#
# === Examples
#
# goenv { ['1.2.2', '1.3.1']: }
#
define goenv::version () {
  include goenv::params

  $version = $title
  $package_name = "goenv-go-${version}"

  package { $package_name:
    ensure  => latest,
    notify  => Goenv::Rehash[$version],
    require => Class['goenv'],
  }

  goenv::rehash { $version: }
}
