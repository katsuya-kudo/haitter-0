class InquiryController < ApplicationController
  
  def inquiry
    @inquiry = Inquiry.new(user_name: params[:user_name],
                      email: params[:email],
                      content: params[:content])
    if @inquiry.save
      flash[:notice] = "送信が完了しました"
    redirect_to("/posts/index")
    else
      render("inquiry_form")
    end
  end
  
  def inquiry_form
    @inquiry = Inquiry.new
  end
end
