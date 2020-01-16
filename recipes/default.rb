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

# resource services+
service 'nginx' do
  action [:enable, :start]
end

# npm installs
nodejs_npm 'pm2'

# resource template
template '/etc/nginx/sites-available/proxy.conf' do
  source 'proxy.conf.erb'
  notifies :restart, 'service[nginx]'
end

# resource link
link '/etc/nginx/sites-enabled/proxy.conf' do
  to '/etc/nginx/sites-available/proxy.conf'
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart, 'service[nginx]'
end
