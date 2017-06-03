class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2,:facebook]
  #has_secure_password

  #validates :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :email, presence: true, uniqueness: true

  def self.search(search)
    if search
        where('name LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%")
    else
        all
    end
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(
          name: data['name'],
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
    end
    user


    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0,20]
    #   user.name = auth.info.name   # assuming the user model has a name
    #   user.image = auth.info.image # assuming the user model has an image
    #   # If you are using confirmable and the provider(s) you use validate emails, 
    #   # uncomment the line below to skip the confirmation emails.
    #   # user.skip_confirmation!
    # end
  end
end
