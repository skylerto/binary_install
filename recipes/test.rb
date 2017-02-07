#
# Cookbook Name:: binary_install
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
binary_install 'tomcat' do
  source 'apache-tomcat-8.5.11.tar.gz'
  destination '/etc'
  archive 'tar.gz'
  strip_directory true
  action :install
end
