select pg_terminate_backend(pg_stat_activity.pid)
from pg_stat_activity
where pg_stat_activity.datname = :'dbname'
  and pid <> pg_backend_pid();

drop database if exists :dbname;

