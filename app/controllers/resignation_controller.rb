class ResignationController < ApplicationController
  
  def resignation
    @resignation = Resignation.new(reason: params[:reason],
                                    user_id: @current_user.id)
                    
    if @resignation.save
      
      redirect_to("/resignation_destroy_form")
    else
      render("resignation_form")
    end
  end
  
  def resignation_form
    @resignation = Resignation.new
  end
  
  def resignation_destroy_form
    @resignation = Resignation.new
  end
  
  def resignation_destroy
    
    flash[:notice] = "退会しました"
    
    
  end
  
end
