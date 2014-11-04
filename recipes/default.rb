#
# Cookbook Name:: cookbook_qubell_mssql 
# Recipe:: default
#
# Copyright 2014, QUBELL
#
# All rights reserved - Do Not Redistribute
#

if (node['sql_server']['product_key'].nil? || node['sql_server']['product_key'].empty?)
  node.set['sql_server']['instance_name']="SQLEXPRESS"
else
  node.set['sql_server']['instance_name']="MSSQLSERVER"
end

include_recipe "sql_server"
include_recipe "sql_server::server"

directory "#{Chef::Config[:node_path]}" do
  mode "0775"
  action :create
  recursive true
  owner node['current_user']
end

