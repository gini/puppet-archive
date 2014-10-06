archive { 'apache-tomcat-6.0.26':
  ensure => present,
  url    => 'http://archive.apache.org/dist/tomcat/tomcat-6/v6.0.26/bin/apache-tomcat-6.0.26.tar.gz',
  target => '/opt',
}

archive { 'apache-tomcat-8.0.11':
  ensure    => present,
  url       => 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.11/bin/apache-tomcat-8.0.11.zip',
  extension => 'zip',
  username  => 'example',
  password  => 'example',
  target    => '/opt',
}

