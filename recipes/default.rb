#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


execute 'apt-get update -y'

package 'openjdk-7-jre' do
  action :install
end

group 'tomcat'

user 'tomcat' do
  manage_home false
  shell '/bin/nologin'
  group 'tomcat'
  home '/opt/tomcat'
end

package 'tomcat7' do
  action :install
end

service 'tomcat7' do
  action [:enable, :start]
end

template '/etc/tomcat7/tomcat-users.xml' do
  source 'tomcat-users.xml.erb'
  notifies :restart, 'service[tomcat7]', :immediately
end

directory '/tmp/test/' do
  recursive true
  action :create
  owner 'tomcat'
  group 'tomcat'
end

file '/tmp/test/test.txt' do
  content 'This is the content of test file'
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
end
