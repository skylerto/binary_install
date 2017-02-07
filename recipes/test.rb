#
# Cookbook Name:: binary_install
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

install = node['binary_install']

binary_install 'apache-tomcat-8.5.11.tar.gz' do
  service 'tomcat'
  destinations install['default_directory']
  archive 'tar.gz'
  strip_directory install['strip_directory']
  action :install
end
