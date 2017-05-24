class HomeController < ApplicationController
  
  def index
    if user_signed_in?
      
      @user = current_user
      @picture = Picture.find_by(user_id: @user.id) ? Picture.find_by(user_id: @user.id).source : ""
      @fol = Picture.where(user_id: @user.following_ids).order('id DESC')
    else
      redirect_to "/users/sign_in"
    end
  end

  def show
    @user = User.new
  end
  
  def search
    if user_signed_in?
      @user = current_user
      @search = User.search(params[:q])
      @user_list = @search.result
    else
      redirect_to "/users/sign_in"
    end
  end
end
