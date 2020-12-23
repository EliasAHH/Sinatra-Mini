class BooksController < ApplicationController

      #index 

  get "/books" do
    @books = Book.all
    erb :'books/index' 
  end 

  #create 
  post '/books' do
    @book = Book.create(author:params[:author], title:params[:title], snippet:params[:snippet])
    redirect to ("/books/#{@book.id}")
  end 

  #edit
  get '/books/:id/edit' do
    @book = Book.find(params[:id])
    erb :'books/edit' 
  end 

  #patch 

  patch '/books/:id' do
    @book = Book.find(params[:id])
    # @book.update(author:params[:author], title: params[:title], snippet:params[:snippet])
    @book.update(params["book"])
    
    redirect "/books/#{@book.id}"
  end 

  #delete
  delete "/books/:id" do
    @book = Book.find(params[:id])
    @book.destroy
    redirect '/books'
  end 

   #new
   get '/books/new' do
    erb :'books/new' 
  end 

  # show 
  get "/books/:id" do 
    @book = Book.find(params[:id])
    erb :'books/show' 
  end 

end 