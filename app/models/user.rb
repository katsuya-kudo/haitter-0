class User < ApplicationRecord
    validates :user_name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
end
