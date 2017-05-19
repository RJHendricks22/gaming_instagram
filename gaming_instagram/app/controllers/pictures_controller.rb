class PicturesController < ApplicationController
  
  def index
    if user_signed_in?
      @current_user = current_user
      @user = User.find_by(username: params[:username])
      @pictures = Picture.where(user_id: @user.id)
      @picture = Picture.new
      @aws
      if @user.id == @current_user.id
        @new_post = ""
        @test = "test"
      else
        @test = "This is not same person"
      end
    else
      redirect_to "/users/sign_in"
    end
  end
  
  
  def show
    if user_signed_in?
      @current_user = current_user
      @user = User.find_by(username: params[:username])
      @picture = Picture.find_by(id: params[:pic_id])
      if @user.id == @current_user.id
        @new_post = ""
        @test = "test"
      else
        @test = "This is not same person"
      end
    else
      redirect_to "/users/sign_in"
    end
  end
  
  def new
    @picture = Picture.new
  end
  
  def create
    @picture = Picture.new(picture_params)
    
    if @picture.save
      redirect_to "/#{current_user.username}"
    else 
      redirect_to '/'
    end
  end
  
  
  private
  
  def picture_params
    params.require(:picture).permit(:user_id, :likes, :game, :caption, :image)
  end
  
  
end
