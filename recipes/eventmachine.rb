# Cookbook Name:: roma
# Recipe:: default
#
# Copyright (C) 2015 Rui Bando
#
gem_package "eventmachine" do
  gem_binary node['roma']['gem_path']
  :install
end
