class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #has_secure_password

  validates :password_confirmation, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  def self.search(search)
    if search
        where('name LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%")
    else
        all
    end
  end
end
