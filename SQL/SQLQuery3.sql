select client_net_address,local_net_address from sys.dm_exec_connections where session_id=@@spid;