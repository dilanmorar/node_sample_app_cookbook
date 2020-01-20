#
# Cookbook:: node_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# imports
include_recipe 'apt'
include_recipe 'nodejs'

# apt updates
apt_update 'update sources' do
  action :update
end

package 'nginx'
# package 'npm'

# resource services+
service 'nginx' do
  action [:enable, :start]
end

# npm installs
nodejs_npm 'pm2'

# resource template
template '/etc/nginx/sites-available/proxy.conf' do
  source 'proxy.conf.erb'
  variables proxy_port: node['nginx']['proxy_port']
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










# bash 'mongo to source list using key' do
#   code <<-EOH
#     wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
#     echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
#     EOH
#   end
#
# apt_update
#
# bash 'install mongo' do
#   code <<-EOH
#     sudo apt install mongodb-org=4.2.1 mongodb-org-server=4.2.1 mongodb-org-shell=4.2.1 mongodb-org-mongos=4.2.1 mongodb-org-tools=4.2.1
#     EOH
#   end
#
# # package 'mongodb-org=3.2.20' do
# #   action :install
# # end
#
# service 'mongod' do
#   action [:start, :enable]
# end
