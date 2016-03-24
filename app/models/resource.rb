require 'yaml'

class Resource
  attr_reader :id, 
              :title, 
              :url,
              :screenshot

  def self.all 
    YAML.load_file("lib/resources.yml").map do |raw_resource_data|
      new(raw_resource_data.first, raw_resource_data.last)
    end
  end

  def self.total
    YAML.load_file("lib/resources.yml").count
  end

  def initialize(id, data)
    @id       = id
    @title    = data["title"]
    @url      = data["url"]
    @screenshot = data["screenshot"]
  end
end