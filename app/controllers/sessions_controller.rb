class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad. Please try again."
      redirect_to login_form_path
    end
  end
end