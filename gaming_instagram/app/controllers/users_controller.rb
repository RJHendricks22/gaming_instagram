class UsersController < ApplicationController
  
  def followers
    @follow = "test"
    @user = current_user
    @profile = params[:id].to_i
    if @user.id == @profile
      @followers = @user.followers
      @test = "this person"
    else
      @followers = ""
      @test = "that person"
    end
  end
  
  def following
    @user = current_user
    @profile = params[:id].to_i
    if @user.id == @profile
      @following = @user.following
      @test = "this person"
    else
      @followers = ""
      @test = "that person"
    end
  end
  
  def createfollow
    @user = User.find_by(username: params[:username])
    current_user.active_relationships.create(followed_id: @user.id)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
  
  def destroyfollow
    @user = Relationship.find(params[:id]).followed
    current_user.active_relationships.delete(followed_id: @user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
