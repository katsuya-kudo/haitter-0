class Resignation < ApplicationRecord
    validates :reason, {presence: true, length: {maximum: 200}}
    validates :user_name, {presence: true}
    validates :email, {presence: true}
    validates :password, {presence: true}
end
