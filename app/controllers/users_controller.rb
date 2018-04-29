class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
     if  @user.id != current_user.id
      redirect_to user_path
     end

  end

  def index
  	@book = Book.new
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
   end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	puts user.profile_image
  	redirect_to user_path(user.id)

  end

 private
   def user_params
   	params.require(:user).permit(:name, :introduction, :profile_image)
   end

end
