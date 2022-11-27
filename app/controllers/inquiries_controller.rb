class InquiriesController < ApplicationController
  
  def create
    @inquiries = Inquiry.new(content: params[:content],
                            user_id: @current_user.id)
    if @inquiries.save
      flash[:notice] = "送信が完了しました"
    redirect_to("/posts/index")
    else
      render("inquiries/new")
    end
  end
  
  def new
    @inquiries = Inquiry.new
  end
  
  def index
      @inquiries = Inquiry.all.order(created_at: :desc)
  end
  
  
end
