define fluentd::source (
  $type, 
  $tag      = false,
  $format   = false, 
  $config   = {},
  ) {


  #file { $::name:
  #      path    => "/etc/td-agent/config.d/$::name.conf",
  #      ensure  => file,
  #      require => Package['td-agent'],
  #      content => template("fluentd/source.erb"),
  #}

  concat::fragment { "source_$title":
    target  => "/etc/td-agent/config.d/$title.conf",
    require => Package['td-agent'],
    content => template('fluentd/source.erb'),
  }
}