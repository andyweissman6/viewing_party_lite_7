class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad. Please try again."
      redirect_to login_form_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'

    #reset_session
  end

  private
  def user_params
    params.permit(:user_id)
  end

end