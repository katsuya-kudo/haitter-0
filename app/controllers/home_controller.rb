require 'rexml/document'
require 'net/http'
require 'uri'
class HomeController < ApplicationController
  before_action :forbid_login_user,{only: [:top]}
  
  def top
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
  
  
  def about
  end
  
end
