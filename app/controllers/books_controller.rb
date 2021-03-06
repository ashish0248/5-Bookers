class BooksController < ApplicationController

	def top
  	end

	def index
		@book = Book.new
		@books = Book.all
		@user = User.find(current_user.id)
	end


	def show
		@book = Book.new
		@books = Book.find(params[:id]) 
		@user = @books.user
	end

	def create
		@books = Book.all
		@user = User.find(current_user.id)
		@book = Book.new(book_params)
		@book.user_id = current_user.id
			if @book.save
				flash[:success] = "Book was successfully created."
          		redirect_to book_path(@book.id)
        	else
          		render 'index'
          	end
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user == current_user

		else
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:success] = "Book was successfully updated."
  			redirect_to book_path(@book.id)
  		else 
  			render 'edit'
  		end
	end

	def destroy
		@book = Book.find(params[:id])
   		@book.destroy
   		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:title, :body,)
	end

end