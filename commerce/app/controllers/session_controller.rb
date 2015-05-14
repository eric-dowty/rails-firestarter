class SessionController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:errors] = 'Invalid login'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to home_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end