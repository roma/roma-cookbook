# Cookbook Name:: roma
# Recipe:: default
#
# Copyright (C) 2015 Rui Bando
#
src_dir    = '/usr/local/src'
tc_ruby_version     = node['roma']['tc_ruby']['version']
tc_ruby_source_uri  = node['roma']['tc_ruby']['source_uri']

remote_file "#{src_dir}/v#{tc_ruby_version}.tar.gz" do
  not_if { ::File.exist?("#{src_dir}/v#{tc_ruby_version}.tar.gz") }
  source "#{tc_ruby_source_uri}"
end

bash 'install_tc_ruby' do
  not_if { ::File.exist?("#{src_dir}/tokyocabinet-ruby-#{tc_ruby_version}/tokyocabinet-#{tc_ruby_version}.gem") }
  code <<-EOL
    cd #{src_dir}/
    tar -zxvf v#{tc_ruby_version}.tar.gz
    cd tokyocabinet-ruby-#{tc_ruby_version}
    gem build tokyocabinet.gemspec
  EOL
end

gem_package "tokyocabinet" do
  gem_binary node['roma']['gem_path']
  source "#{src_dir}/tokyocabinet-ruby-#{tc_ruby_version}/tokyocabinet-#{tc_ruby_version}.gem"
  options node['roma']['tc_ruby']['gem_option']
  action :install
end
