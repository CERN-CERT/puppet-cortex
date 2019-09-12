# == Class: cortex::service
#
# Enable Cortex package.
class cortex::service {
  require ::cortex::config

  service { 'cortex.service':
    ensure => running,
    enable => true,
  }
}
