class ResignationsController < ApplicationController
  
  def create
    @resignations = Resignation.new(reason: params[:reason],
                                    user_id: @current_user.id)
                    
    if @resignations.save
      flash[:notice] = "退会しました"
      redirect_to("/")
    else
      render("resignation_form")
    end
  end
  
  def new
    @resignations = Resignation.new
  end
  
end
