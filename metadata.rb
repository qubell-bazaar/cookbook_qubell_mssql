name             'cookbook_qubell_mssql'
maintainer       'QUBELL'
maintainer_email 'abutovich@qubell.com'
license          'All rights reserved'
description      'Installs/Configures MSSQL server on Windows Server 2012R2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends          'sql_server', '>= 2.2.0'
depends          'database', '>= 2.3.0'
