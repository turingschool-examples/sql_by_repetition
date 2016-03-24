require 'sequel'

db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/sqlbyrepetition.db')
DB = Sequel.postgres(db.path[1..-1], :host => db.host, :port => db.port, :max_connections => 5, :user => db.user, password: db.password)
