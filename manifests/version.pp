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
# === Parameters
#
# [*ensure*]
#   present or absent. Whether to install or remove this version.
#   Default: present
#
define goenv::version (
  $ensure = present,
) {
  include goenv::params

  $version = $title

  if $ensure == present {

    exec { "install-goenv-go-${version}":
      command     => "${goenv::params::goenv_binary} install ${version}",
      environment => "GOENV_ROOT=${goenv::params::goenv_root}",
      creates     => "${goenv::params::goenv_root}/versions/${version}/bin/go",
      require     => Class['goenv'],
    }

  } else {

    exec { "uninstall-goenv-go-${version}":
      command     => "${goenv::params::goenv_binary} uninstall ${version}",
      environment => "GOENV_ROOT=${goenv::params::goenv_root}",
      onlyif      => "test -d ${goenv::params::goenv_root}/versions/${version}",
      require     => Class['goenv'],
    }

  }
}
