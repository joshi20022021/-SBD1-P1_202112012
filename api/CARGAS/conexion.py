import os
import cx_Oracle

os.environ["ORACLE_HOME"] = "/opt/oracle/instantclient_21_9"
os.environ["LD_LIBRARY_PATH"] = "/opt/oracle/instantclient_21_9"
cx_Oracle.init_oracle_client(lib_dir="/opt/oracle/instantclient_21_9")

print(cx_Oracle.clientversion())
