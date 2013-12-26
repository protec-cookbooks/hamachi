#
# Cookbook Name:: hamachi
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "/tmp/logmein-hamachi_2.1.0.119-1_amd64.deb" do
  source "https://secure.logmein.com/labs/logmein-hamachi_2.1.0.119-1_amd64.deb"
  mode 0644
  checksum "5514f0644a00b313b16b1eddbe88080e418a13a7f1488ffb11b08eaafd5a21a0"
end

dpkg_package "hamachi" do
  source "/tmp/logmein-hamachi_2.1.0.119-1_amd64.deb"
  action :install
end

apt_repository "haguichi" do
  uri "http://ppa.launchpad.net/webupd8team/ppa/haguichi"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "EEA14886"
  action :add
end

package "haguichi" do
    action :install
end
