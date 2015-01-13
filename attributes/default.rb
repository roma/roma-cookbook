# common attribute
default['roma']['gem_path']   = '/opt/rbenv/shims/gem'

# ROMA attribute
default['roma']['target_dir']  = '/opt/roma'
default['roma']['target_user'] = 'root'
default['roma']['target_group'] = 'root'
default['roma']['app_name'] = 'roma_app'
default['roma']['version'] = '1.0.0'
default['roma']['source_uri'] = 'https://github.com/roma/roma/archive/v1.0.0.tar.gz'

# tc_ruby attribute
default['roma']['tc_ruby']['target_user']  = 'root'
default['roma']['tc_ruby']['version']      = '1.31.a'
default['roma']['tc_ruby']['source_uri']   = 'https://github.com/roma/tokyocabinet-ruby/archive/v1.31.a.tar.gz'
default['roma']['tc_ruby']['gem_option']   = '-- --with-tokyocabinet-dir=/usr/local/libexec'
