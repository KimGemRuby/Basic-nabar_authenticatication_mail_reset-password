class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "logged in successfully"
    else
      flash[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    if session[:user_id] = nil
      @user = User.find_by(id: session[:user_id])
      redirect_to root_path, notice: "Logged out!"
    end
  end


end