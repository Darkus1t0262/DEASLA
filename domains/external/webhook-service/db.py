import mysql.connector
import os

conn = mysql.connector.connect(
  host=os.getenv("MYSQL_HOST", "mysql"),
  user=os.getenv("MYSQL_USER", "deasla"),
  password=os.getenv("MYSQL_PASSWORD", "pass"),
  database=os.getenv("MYSQL_DATABASE", "deasla_mysql")
)

print("✅ Connected to MySQL")
