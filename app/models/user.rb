class User < ApplicationRecord
    has_secure_password
  
    validates :name, :password_confirmation, :date_birth, :place_birth, presence: true
    validates :password, presence: true, confirmation: true
    validates :email, presence: true, uniqueness: true
end
