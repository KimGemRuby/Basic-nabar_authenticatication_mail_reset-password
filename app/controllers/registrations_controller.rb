class  RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @uesr = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path, notice: "Succefully created account"
    else
      render 'new'
    end
  end

  private

  def user_params
 params.require(:user).permit(:email, :password, :password_confirmation)
  end


end