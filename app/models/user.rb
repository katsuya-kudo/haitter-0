class User < ApplicationRecord
    has_secure_password
    
    validates :user_name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
   
   def posts
       return Post.where(user_id: self.id)
   end
   
end
