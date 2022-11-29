class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only:[:edit, :update]}
  before_action :forbid_admin_flag_false_user, {only: [:index]}
  def index 
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_name: params[:name],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation],
                      district: params[:district])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
    redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.user_name = params[:name]
    @user.email = params[:email]
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.resign_flag == false && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      if @user && @user.resign_flag == true
        @error_message = "退会済みのユーザーです"
      else
        @error_message = "メールアドレスまたはパスワードが間違っています"
      end
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
    
  end

  def login_form
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
  def haittum
    @user = User.find_by(id: params[:id])
    @haittum = Haittum.where(user_id: @user.id)
  end
  
end
