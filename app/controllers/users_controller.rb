class UsersController < ApplicationController

  def index
  	@book = Book.new
  	@users = User.all
  	@user = User.find(current_user.id)
  end

  def show
  	@book = Book.new
  	@user = User.find(params[:id])
    @books = @user.books
  end

  def edit
	 @user = User.find(params[:id])
      if @user == current_user

      else
        redirect_to user_path(current_user.id)
      end
  end


  def update
  	@user = User.find(params[:id])
      if@user.update(user_params)
          flash[:success] = "usersinfomation was successfully updated."
          redirect_to user_path(@user.id)
      else
        flash[:success] = "usersinfomation was false updated."
        render 'edit'
      end
  end

  private

  def user_params
 	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

