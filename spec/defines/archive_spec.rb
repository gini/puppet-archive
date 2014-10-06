require 'spec_helper'
require 'rspec-puppet'

describe 'archive', :type => :define do
  let(:title)     { 'apache-tomcat-8.0.11' }
  let(:params) { {
    :ensure    => 'present',
    :url       => 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.11/bin/apache-tomcat-8.0.11.zip',
    :extension => 'zip',
    :username  => 'example',
    :password  => 'example',
    :target    => '/opt',
  } }
  it { should compile }
  it { should compile.with_all_deps }
  it { should contain_class('archive::prerequisites') }
  it { should contain_archive__download('apache-tomcat-8.0.11.zip') }
  it { should contain_archive__extract('apache-tomcat-8.0.11') }
  it { should contain_exec('download digest of archive apache-tomcat-8.0.11.zip') }
  it { 
    should contain_exec('download archive apache-tomcat-8.0.11.zip and check sum').with_command(
      'curl --user example:example -s  -L  -o /usr/src/apache-tomcat-8.0.11.zip ' +
      'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.11/bin/apache-tomcat-8.0.11.zip'
    )
  }
  it { 
    should contain_exec('Unpack apache-tomcat-8.0.11').with_command(
      'mkdir -p /opt/apache-tomcat-8.0.11 && unzip -o /usr/src/apache-tomcat-8.0.11.zip -d /opt/apache-tomcat-8.0.11'
    )
  }
end