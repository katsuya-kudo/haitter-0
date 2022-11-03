class Inquiry < ApplicationRecord
    validates :user_name, {presence: true}
    validates :email, {presence: true}
    validates :content, {presence: true, length: {maximum: 200}}
end
