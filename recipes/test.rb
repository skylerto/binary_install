#
# Cookbook Name:: binary_install
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

install = node['binary_install']

binary_install 'test.zip' do
  service 'test'
  destinations install['default_directory']
  archive 'zip'
  strip_directory install['strip_directory']
  action :install
end
