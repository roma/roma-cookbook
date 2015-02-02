# Cookbook Name:: roma
# Recipe:: default
#
# Copyright (C) 2015 Rui Bando
#
src_dir    = '/usr/local/src'
roma_dir           = node['roma']['target_dir']
roma_source_uri    = node['roma']['source_uri']
version            = node['roma']['version']
app                = node['roma']['app_name']

remote_file "#{src_dir}/v#{version}.tar.gz" do
  not_if { ::File.exist?("#{src_dir}/v#{version}.tar.gz") }
  source "#{roma_source_uri}"
end

bash 'install_roma' do
  not_if { ::File.exist?("#{roma_dir}/roma/ruby/server/bi/romad") }
  code <<-EOL
    cd #{src_dir}
    tar -zxvf v#{version}.tar.gz
    mv roma-#{version} #{roma_dir}
  EOL
end

bash 'crate_app' do
  not_if { ::File.exist?("#{roma_dir}/#{node['roma']['app_name']}") }
  code <<-EOL
    cd #{roma_dir}
    mkdir -p #{node['roma']['app_name']}/logs #{node['roma']['app_name']}/routing #{node['roma']['app_name']}/ds #{node['roma']['app_name']}/wb
  EOL
end

execute "change_permission" do
  command  "chown -R #{node['roma']['target_user']}:#{node['roma']['target_group']} #{roma_dir}"
  action :run
end

