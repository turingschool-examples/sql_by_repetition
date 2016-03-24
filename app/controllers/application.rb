class Application < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/questions/:id' do |id|
    @question = "Show all of the artists"
    if params[:submission]
      @data, @message = Attempt.submit(params[:submission])
      # require 'pry'; binding.pry
    end
    erb :question_show
  end
end
