class ResignationsController < ApplicationController
  
  def create
    @resignations = Resignation.new(reason: params[:resignation][:reason],
                                    user_id: session[:user_id])
    @user = User.find_by(id: session[:user_id])
    @user.resign_flag = true
    if @resignations.save && @user.save
       session[:user_id] = nil
      flash[:notice] = "退会しました"
      redirect_to("/login")
    else
      render("resignations/new")
    end
  end
  
  def new
    @resignations = Resignation.new
  end
  
end
