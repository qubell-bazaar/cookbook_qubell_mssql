default['sql_server']['accept_eula'] = true

default[:cookbook_qubell_mssql][:db][:username] = "sa"
default[:cookbook_qubell_mssql][:db][:password] = ""
default[:cookbook_qubell_mssql][:db][:host] = "127.0.0.1"
default[:cookbook_qubell_mssql][:db][:port] = node['sql_server']['port']

default[:cookbook_qubell_mssql][:schema][:username] = nil
default[:cookbook_qubell_mssql][:schema][:password] = nil
default[:cookbook_qubell_mssql][:schema][:host] = node[:cookbook_qubell_mssql][:db][:host] 
default[:cookbook_qubell_mssql][:schema][:port] = node[:cookbook_qubell_mssql][:port]
default[:cookbook_qubell_mssql][:schema][:privileges] = ["all"]
default[:cookbook_qubell_mssql][:schema][:action] = nil
default[:cookbook_qubell_mssql][:schema][:dbname] = nil

default[:cookbook_qubell_mssql][:sql_url] = nil
default[:cookbook_qubell_mssql][:hosts] = ["localhost"]
