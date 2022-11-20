class InquiriesController < ApplicationController
  
  def create
    @inquiries = Inquiry.new(content: params[:content],
                            user_id: @current_user.id)
    if @inquiries.save
      flash[:notice] = "送信が完了しました"
    redirect_to("/posts/index")
    else
      render("inquiry_form")
    end
  end
  
  def new
    @inquiries = Inquiry.new
  end
end
