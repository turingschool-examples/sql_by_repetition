require 'yaml'

class Lesson
  attr_reader :id, 
              :title, 
              :text, 
              :examples, 
              :tasks

  def self.number(num)
    raw_lesson_data = raw_lessons.find { |key, val| key == num.to_i }
    id = raw_lesson_data.first
    lesson_data = raw_lesson_data.last
    new(id, lesson_data)
  end

  def self.all 
    raw_lessons.map do |raw_lesson_data|
      new(raw_lesson_data.first, raw_lesson_data.last)
    end
  end

  def self.total
    raw_lessons.count
  end

  def self.raw_lessons
    YAML.load_file("lib/lessons.yml")
  end

  def self.progress(id)
    id.to_f / total * 100
  end

  def initialize(id, data)
    @id       = id
    @title    = data["title"]
    @text     = data["text"]
    @examples = data["examples"]
    @tasks    = data["tasks"]
  end

  def next_id
    if id == Lesson.total
      id
    else
      id + 1
    end
  end

  def previous_id
    if id == 1
      1
    else
      id - 1
    end
  end
end