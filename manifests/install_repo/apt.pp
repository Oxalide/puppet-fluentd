##apt.pp

# Class: fluentd::install_repo::apt ()
#
#
class fluentd::install_repo::apt () {
  apt::source { 'treasure-data':
    location => "http://packages.treasuredata.com/2/debian/${::lsbdistcodename}/",
    repos    => 'contrib',
  }

  file { '/tmp/packages.treasure-data.com.key':
    ensure => file,
    source => 'puppet:///modules/fluentd/td-agent.key',
  }
  -> exec { 'import gpg key Treasure Data':
    command => '/bin/cat /tmp/packages.treasure-data.com.key | apt-key add -',
    unless  => "/usr/bin/apt-key list | grep -q 'Treasure Data'",
    notify  => Class['::apt::update'],
  }
}
