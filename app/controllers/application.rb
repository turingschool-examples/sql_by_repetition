class Application < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/lessons' do
    @lessons = Lesson.all
    erb :lessons_index
  end

  get '/lessons/:id' do |id|
    @lesson = Lesson.number(params[:id])
    if params[:attempt]
      @attempt = Attempt.new(params[:attempt])
      @attempt.check!
    end
    erb :lesson_show, :escape_html => true
  end

  get '/playground' do
    if params[:attempt]
      @attempt = Attempt.new(params[:attempt])
      @attempt.check!
    end
    erb :playground, :escape_html => true
  end

  get '/resources' do
    @resources = Resource.all
    erb :resources
  end

  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end
end
