# == Class: prerequisites
#
# Ensure any required dependencies for archive download and extraction are present.
#
# Parameters:
#
# None
#
class archive::prerequisites {
  if !defined(Package['curl']) {
    package{'curl': ensure => present }
  }

  if !defined(Package['tar']) {
    package{'tar': ensure => present }
  }

  if !defined(Package['unzip']) {
    package{'unzip': ensure => present }
  }
}
