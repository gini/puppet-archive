# == Class: prerequisites
#
# Ensure any required dependencies for archive download and extraction are present.
#
# Parameters:
#
# None
#
class archive::prerequisites {

  # list of packages needed for download and extraction
  $packages = [ 'curl', 'unzip', 'tar', ]

  # install additional packages if missing
  anchor { 'archive::prerequisites::begin': } ->
  package { $packages:
    ensure => installed,
  } -> 
  anchor { 'archive::prerequisites::end': }
}
