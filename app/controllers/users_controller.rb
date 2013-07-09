class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.where(access_token: params[:user][:access_token]).length > 0
      user = User.where(access_token: params[:user][:access_token]).last
      redirect_to sample_user_path(user.username)
    else
      @user = User.new(params[:user])
      @user.facebook_user_details(params[:user][:access_token])
      if @user.save
        flash[:notice] = "User created successfully"
        redirect_to sample_user_path(@user.username)
      else
        flash[:error] = "User not created successfully"
        render "new"
      end
    end
  end

  def show
    @user = User.find_by_username(params[:username])
  end
end
