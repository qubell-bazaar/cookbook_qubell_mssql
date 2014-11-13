# MSSQL database management

sql_server_database node[:cookbook_qubell_mssql][:schema][:dbname] do
  connection node[:cookbook_qubell_mssql][:db]
  action node[:cookbook_qubell_mssql][:schema][:db_action]
end
