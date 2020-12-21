require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # allows us to use patch / delete request 
    set :method_override, true 
    
  end


  get "/" do
    erb :welcome
  end

  #index 

  get "/books" do
    @books = Book.all
    erb :index 
  end 

  #create 
  post '/books' do
    @book = Book.create(author:params[:author], title:params[:title], snippet:params[:snippet])
    redirect to ("/books/#{@book.id}")
  end 

  #edit
  get '/books/:id/edit' do
    @book = Book.find(params[:id])
    erb :edit 
  end 

  #patch 

  patch '/books/:id' do
    binding.pry
  end 

   #new
   get '/books/new' do
    erb :new 
  end 

  # show 
  get "/books/:id" do 
    @book = Book.find(params[:id])
    erb :show
  end 

  
 


end
