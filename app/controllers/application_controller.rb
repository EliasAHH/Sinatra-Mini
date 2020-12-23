require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Whatever"
    # allows us to use patch / delete request 
    set :method_override, true 
    
  end


  get "/" do
    erb :welcome
  end

end
