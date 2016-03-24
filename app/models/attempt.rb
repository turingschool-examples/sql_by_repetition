# DB = Sequel.postgres('sqlbyrepetition.db', :host => 'localhost', :port => 5432, :max_connections => 5)

class Attempt
  attr_reader :submission, :results, :message
  def initialize(input)
    @submission = format(input)
  end

  def check!
    temp_container = []
    temp_message   = ""
    DB.transaction do 
      begin
        temp_container << DB.fetch(submission).to_a  
      rescue Sequel::ForeignKeyConstraintViolation, Sequel::DatabaseError => e
        temp_message += e.to_s
      end
      raise Sequel::Rollback  
    end
    @results = temp_container.flatten
    @message = temp_message
  end

  def message
    if submission.downcase.start_with?("drop")
      "Sorry, you do not have permission to do that."
    else
      @message
    end
  end

  def format(input)
    input += ";" unless input[-1] == ";"
    input.gsub('"', "'")
  end
end