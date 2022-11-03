class ResignationController < ApplicationController
  
  def resignation
    @resignation = Resignation.new(reason: params[:reason],
                    user_name: params[:user_name],
                    email: params[:email],
                    password: params[:password])
    if @resignation.save
        flash[:notice] = "退会申請を受け付けました"
    redirect_to("/")
    else
      render("resignation_form")
    end
  end
  
  def resignation_form
    @resignation = Resignation.new
  end
  
end
