class BooksController < ApplicationController
  before_action :correct_book, only: [:edit, :update, :destroy]


  def root
  	
  end

  def index
  	@books = Book.all.order(created_at: :desc)
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
    @book1 = Book.new
    # @user = User.find(params[:id])
    # puts @book.user
    if current_user.id != @book.user_id
      @user = User.find(params[:id])
    else
      @user = current_user
    end

  end

  def new
  	@book = Book.new
  end

  def create
  	 book = Book.new(book_params)
     book.user_id = current_user.id
  	 book.save
  	 redirect_to book_path(book.id)
  end

  def edit
      @book = Book.find(params[:id])
      @book.user_id = current_user.id
     if @book.save
      else
      redirect_to users_path
    end
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book)

  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  	end

    def books
    @book = Book.find(params[:id])
    @books = Book.all.order(created_at: :desc)
    @book = Book.new
    end

    def user
    @book = Book.find(params[:id])

    end

   private
   def book_params
   	params.require(:book).permit(:title, :body)
   end

   def correct_book
    book = Book.find(params[:id])
    if current_user.id != book.user.id
      redirect_to books_path
    end
   end

end
