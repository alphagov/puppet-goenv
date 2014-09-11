# == Class: goenv::package
#
# Install the goenv package. Additionally disables the goenv install and
# ununstall commands, to prevent conflicts with the package-managed versions.
#
class goenv::package {
  package { 'goenv':
    ensure => latest,
  }

  $libexec_dir = '/usr/lib/goenv/libexec'

  exec { 'dpkg-divert_of_goenv-install':
    command => "dpkg-divert --rename ${libexec_dir}/goenv-install",
    creates => "${libexec_dir}/goenv-install.distrib",
    require => Package['goenv'],
  } ->
  file { "${libexec_dir}/goenv-install":
    source => 'puppet:///modules/goenv/libexec/goenv-install-stub',
    mode   => '0755',
  }

  exec { 'dpkg-divert_of_goenv-uninstall':
    command => "dpkg-divert --rename ${libexec_dir}/goenv-uninstall",
    creates => "${libexec_dir}/goenv-uninstall.distrib",
    require => Package['goenv'],
  } ->
  file { "${libexec_dir}/goenv-uninstall":
    source => 'puppet:///modules/goenv/libexec/goenv-install-stub',
    mode   => '0755',
  }
}
