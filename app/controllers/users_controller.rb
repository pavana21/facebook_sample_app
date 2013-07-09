class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.facebook_user_details(params[:user][:access_token])
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to user_path(@user)
    else
      flash[:error] = "User not created successfully"
      render "new"
    end
  end
end
