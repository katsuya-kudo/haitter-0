class Inquiry < ApplicationRecord
        validates :content, {presence: true, length: {maximum: 200}}
        validates :user_id, {presence: true}
        belongs_to :user
        
 #def user
       #return User.find_by(user_id: self.user_id)
 #end
        
        
end



