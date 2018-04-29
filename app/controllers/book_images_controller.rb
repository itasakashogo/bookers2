class BookImagesController < ApplicationController

   def new
   	@book_image = BookImage.new
   end

   def create
   	@book_image = BookImage.new(book_image_params)
   	@book_image.user_id = current_user.id
   	if @book_image.save
   		redirect_to book_image_path
   else
   		render :new
   	end
end

   def index
   	 @book_images = BookImage.page(params[:page]).reverse_order
   end

   def show
   	@book_image = BookImage.find(params[:id])
   end

   def destroy
   	@book_image = BookImage.find(params)[:id]
   	@book_image.destroy
   	redirect_to book_images_path
   end

private
 def book_image_params
 	params.require(:book_image).permit(:shop_name, :image, :caption, :user_id)
 end

end

