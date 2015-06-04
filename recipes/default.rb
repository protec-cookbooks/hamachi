#
# Cookbook Name:: hamachi
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

deps = ["lsb-core"]

deps.each do |dep|
    package dep do
        action :install
    end
end

remote_file "/tmp/logmein-hamachi_2.1.0.139-1_amd64.deb" do
  source "https://secure.logmein.com/labs/logmein-hamachi_2.1.0.139-1_amd64.deb"
  mode 0644
  checksum "c7b70b1529384a4fcbccf662da1ee4bab4d7fd3168ca8d87916571b893bb4d44"
end

dpkg_package "hamachi" do
  source "/tmp/logmein-hamachi_2.1.0.139-1_amd64.deb"
  action :install
end

apt_repository "haguichi" do
  uri "http://ppa.launchpad.net/webupd8team/haguichi/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "EEA14886"
  action :add
end

package "haguichi" do
    action :install
end
