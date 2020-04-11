class BooksController < ApplicationController

	def top
  	end

	def index
		@book = Book.new
		@books = Book.all
		@user = User.find(current_user.id)
	end


	def show
		@book = Book.find(params[:id]) 
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
			if @book.save
          		redirect_to book_path(@book.id)
        	else
          		render :index

          	end
	end

	private

	def book_params
		params.require(:book).permit(:title, :body,)
	end

end