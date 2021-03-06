#
# Cookbook Name:: cookbook_qubell_mssql
# Recipe:: user_manage
#
# Copyright 2014, Qubell
#
# All rights reserved - Do Not Redistribute
#

(node[:cookbook_qubell_mssql][:hosts] | ["localhost"]).each do |host|
  sql_server_database_user node[:cookbook_qubell_mssql][:schema][:username] do
    connection node[:cookbook_qubell_mssql][:db]
    host host
    password node[:cookbook_qubell_mssql][:schema][:password]
    database_name node[:cookbook_qubell_mssql][:schema][:dbname]
    privileges node[:cookbook_qubell_mssql][:schema][:privileges]
    sql_roles node[:cookbook_qubell_mssql][:schema][:db_roles]
    action node[:cookbook_qubell_mssql][:schema][:action]
  end
  sql_server_database_user node[:cookbook_qubell_mssql][:schema][:username] do
    connection node[:cookbook_qubell_mssql][:db]
    host host
    password node[:cookbook_qubell_mssql][:schema][:password]
    database_name node[:cookbook_qubell_mssql][:schema][:dbname]
    privileges node[:cookbook_qubell_mssql][:schema][:privileges]
    sql_roles node[:cookbook_qubell_mssql][:schema][:db_roles]
    action :alter_roles
    not_if { node[:cookbook_qubell_mssql][:schema][:action]=='drop' }
  end
end
