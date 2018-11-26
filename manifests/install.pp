# == Class: cortex::install
#
# Ensure Cortex package is present.
class cortex::install inherits cortex {
  if $cortex::install_from_source {
    package { 'cortex':
      ensure   => installed,
      provider => 'rpm',
      source   => $cortex::source_url,
    }
  } else {
    package { 'cortex':
      ensure => present,
    }
  }
}
