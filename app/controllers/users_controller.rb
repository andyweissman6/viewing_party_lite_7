class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:user_id])
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = "Email already exists. Please try again."
      redirect_to "/register"
    end
  end
  
  private
  def user_params
    params.permit(:name, :email)
  end

end