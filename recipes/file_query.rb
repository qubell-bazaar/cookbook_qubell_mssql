#
# Cookbook Name:: cookbook_qubell_mssql
# Recipe::file_query
#
# Copyright 2014, Qubell
#
# All rights reserved - Do Not Redistribute
#

sql_f = node[:cookbook_qubell_mssql][:sql_url]
sql_f.each_index do |i|
  sql_file = Chef::Config[:file_cache_path] + "/query#{i}.sql"
  remote_file sql_file do
    source sql_f[i]
    mode "0644"
    action :create
  end

  sql_server_database "run #{sql_file}" do
    connection node[:cookbook_qubell_mssql][:schema]
    sql { ::File.open(sql_file).read }
    database_name node[:cookbook_qubell_mssql][:schema][:dbname]
    action :query
  end
end
