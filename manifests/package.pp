# == Class: goenv::package
#
# Install the goenv package. Additionally disables the goenv install and
# ununstall commands, to prevent conflicts with the package-managed versions.
#
class goenv::package {
  include goenv::params

  package { 'goenv':
    ensure => latest,
  }

  # Cleanup diverts that were created by v0.0.2 and earlier of this module
  $libexec_dir = "${goenv::params::goenv_root}/libexec"
  exec { 'cleanup-dpkg-divert_of_goenv-install':
    command =>
      "rm -f ${libexec_dir}/goenv-install && dpkg-divert --rename --remove ${libexec_dir}/goenv-install",
    onlyif  => "test -f ${libexec_dir}/goenv-install.distrib",
    before  => Package['goenv'],
  }
  exec { 'cleanup-dpkg-divert_of_goenv-uninstall':
    command =>
      "rm -f ${libexec_dir}/goenv-uninstall && dpkg-divert --rename --remove ${libexec_dir}/goenv-uninstall",
    onlyif  => "test -f ${libexec_dir}/goenv-uninstall.distrib",
    before  => Package['goenv'],
  }

}
