require 'pg'

conn = PG::Connection.open(:dbname => 'test')
