# == Class: prerequisites
#
# Ensure any required dependencies for archive extractions are present.
#
# Parameters:
#
# None
#
class archive::prerequisites {

  # list of packages needed for extraction
  $archive_packages = [ 'unzip',
                        'tar', ]

  # install additional packages if missing
  package { $archive_packages:
    ensure => installed,
  }
}  
