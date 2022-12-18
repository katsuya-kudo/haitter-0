require 'rexml/document'
require 'net/http'
require 'uri'

class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end
  
  def create
    @post = Post.new(title: params[:post][:title],content: params[:post][:content],user_id: @current_user.id)
    if @post.save
      @image = Image.new(image: params[:image],post_id: @post.id, user_id: @current_user.id )
      @image.save
      flash[:notice] = "投稿を作成しました"
    redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    puts @post.title
    puts @post.content
    @haittum_count = Haittum.where(post_id: @post.id).count
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
    redirect_to("/posts/index")
    else
    render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
  def api
    uri = URI.parse("https://www.data.jma.go.jp/developer/xml/feed/extra.xml")
    response = Net::HTTP.get_response(uri)
    doc = REXML::Document.new(response.body)
    hash = Hash.from_xml(doc.elements["feed"].to_s)
    
    
    @posts = [ ]
    hash.each do |key, value|
      @posts.push(value['entry'])
      end
    @posts = @posts[0]
    p @posts[0]
    
    @data = [ ]
    count = 0
    @posts.each do |post|
      count += 1
      if count % 2 == 0
        next
      else
        @data.push(post)
      end
    end
  end
  
  def ensure_correct_user
  @post = Post.find_by(id: params[:id])
  if @post.user_id != @current_user.id
    flash[:notice] = "権限がありません"
    redirect_to("/posts/index")
  end
  end

end
