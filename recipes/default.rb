#
# Cookbook:: node_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# imports
include_recipe 'apt'
include_recipe 'nodejs'

# npm installs
# nodejs_npm 'pm2'
# include_recipe 'pm2'

# apt updates
apt_update 'update'
package 'nginx'
package 'npm'

# services
service 'nginx' do
  action [:enable, :start]
end

# service 'nginx' do
#   action :enable
# end
#
# service 'nginx' do
#   action :start
# end

# npm installs
nodejs_npm 'pm2'
# run after enabling and starting nginx so integration tests pass
# include_recipe 'pm2'
