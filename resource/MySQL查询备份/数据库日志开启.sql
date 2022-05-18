SET GLOBAL general_log = 'On'
SET GLOBAL general_log_file = '/opt/mysqlrizhi/safe.log'

show binlog events in 'binlog.00000001';

set password for root@localhost = password('yiqieweiwan...');