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

  exec { "install-goenv-go-${version}":
    command     => "${goenv::params::goenv_binary} install ${version}",
    environment => "GOENV_ROOT=${goenv::params::goenv_root}",
    creates     => "${goenv::params::goenv_root}/versions/${version}/bin/go",
    require     => Class['goenv'],
  }
}
