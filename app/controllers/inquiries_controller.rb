class InquiriesController < ApplicationController
  before_action :forbid_admin_flag_false_user, {only: [:index]}
  
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
      #@inquiries = Inquiry.all.order(created_at: :desc)
      @inquiries = Inquiry.where(resolve_flag: false).order(created_at: :desc)
      
  end
  
  def destroy
  @inquiry = Inquiry.find_by(id: params[:id])
    #@inquiries.destroy
    @inquiry.resolve_flag = true
    @inquiry.save
    flash[:notice] = "問い合わせ対応完了しました"
    redirect_to("/inquiries/index")
  end
  
  
  
end
