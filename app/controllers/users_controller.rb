class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.new(user_params)

    @user.save!
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    rescue ActiveRecord::RecordInvalid => error
      flash[:error] = ErrorService.new(error).error_messages
      redirect_to "/register"
  end
  
  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end