require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get "/" do
    erb :welcome
  end

  #index 

  get "/books" do
    @books = Book.all
    erb :index 
  end 

  get "/books/:id" do 
    @book = Book.find(params[:id])
    erb :show
  end 

end
