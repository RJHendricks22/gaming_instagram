class HomeController < ApplicationController
  
  def index
    if user_signed_in?
      @user = current_user.id
    else
      redirect_to "/users/sign_in"
    end
  end

  def show
    @user = User.new
  end
  
end
