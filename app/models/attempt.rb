# DB = Sequel.postgres('sqlbyrepetition.db', :host => 'localhost', :port => 5432, :max_connections => 5)

class Attempt
  def self.submit(submission)
    submission += ";" unless submission[-1] == ";"
    results = []
    message = ""
      DB.transaction do 
        begin
          results << DB.fetch(submission).to_a  
        rescue Sequel::ForeignKeyConstraintViolation, Sequel::DatabaseError => e
          message += e.to_s
        end
      raise Sequel::Rollback  
    end

    # [results, message(e)]
    [results.flatten, message.empty? ? "Great job!" : message]
  end

  def self.message(e)
    e ? e : "Great job!"
  end
end