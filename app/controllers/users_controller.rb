class UsersController < ApplicationController
  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad. Please try again."
      render :login_form
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:user_id])
  end

  def create
    user = User.new(user_params)

    user.save!
      redirect_to "/users/#{user.id}"
    rescue ActiveRecord::RecordInvalid => error
      flash[:error] = ErrorService.new(error).error_messages
      redirect_to "/register"
  end
  
  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end