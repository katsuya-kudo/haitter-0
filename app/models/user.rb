class User < ApplicationRecord
    validates :user_name, {presence: true}
    validates :email, {presence: true,uniqueness: true}
    has_secure_password
    has_many :posts
    has_many :inquiries
    
   #def posts
       #return Post.where(user_id: self.id)
   #end
   
end
