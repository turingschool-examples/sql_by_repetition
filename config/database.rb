require 'sequel'

DB = Sequel.postgres('sqlbyrepetition.db', :host => 'localhost', :port => 5432, :max_connections => 5) #:user=>'postgres',:password=>'my_password_here',

# Make sure to change the database name 
# database_name = "my_application_#{Application.environment}"
# db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{database_name}")

# DB = Sequel.connect('sqlite://blog.db')

# ActiveRecord::Base.establish_connection(
#   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#   :host     => db.host,
#   :port     => db.port,
#   :username => db.user,
#   :password => db.password,
#   :database => db.path[1..-1],
#   :encoding => 'utf8'
# )

# Postgres not working locally? Try this work around to use sqlite locally and postgres only in production: 

# if ENV["RACK_ENV"] == "production"
#   db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
#   db_options = {
#     :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#     :host     => db.host,
#     :username => db.user,
#     :password => db.password,
#     :database => db.path[1..-1],
#     :encoding => 'utf8'
#   }
# else
#   db_options = { 
#     adapter: 'sqlite3', 
#     database: 'db/my_application_development'
#   }
# end
# ActiveRecord::Base.establish_connection(db_options)
