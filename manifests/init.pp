# == Class: emacs_orgmode_protocol
#
# Full description of class emacs_orgmode_protocol here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'emacs_orgmode_protocol':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Jim Hansson <jim.hansson@gmail.com>
#
# === Copyright
#
# Copyright 2015 Jim Hansson, unless otherwise noted.
#
class emacs_orgmode_protocol($path = 'C:\ProgramData\chocolatey\lib\Emacs\tools') {
  # protocol endpoint for integration with other tools
  registry::value {
    '(EMACS) org-protocol':
      require => Package['emacs'],
      key => '32:HKEY_CLASSES_ROOT\org-protocol',
      value => '(default)',
      data => 'URL:Org Protocol';
    '(EMACS) url-protocol':
      require => Package['emacs'],
      key => '32:HKEY_CLASSES_ROOT\org-protocol',
      value => 'URL Protocol',
      data => '';
    '(EMACS) open-command':
      require => Package['emacs'],
      key => '32:HKEY_CLASSES_ROOT\org-protocol\shell\open\command',
      value => '(default)',
      data => "$path\\bin\\emacsclientw.exe \"%1\"";
  }
}
