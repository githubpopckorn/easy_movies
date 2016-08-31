class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :posts
#devise :omniauthable, omniauth_providers: [:facebook, :twitter]
 
#  Validaciones para inicio con twitter
#  validates :username, presence: true, uniqueness: true,
#            length: {in: 5..20, too_short: "tiene que tener al menos 5 caracteres", too_long: "El user name puede tener maximo 20 caracteres", 
#            format: {with: /([A-Za-z0-9\-\_]+)/, message: "Username puede solo contener solo letras número y guiones"}}
    
  def self.find_or_create_by_omniauth(auth)
      user = User.where(provider: auth[:provider], uid: auth[:uid]).first
      return user if user
          usuario = User.create(
              name: auth[:name],
              lastname: auth[:lastname],
              username: auth[:username],
              email: auth[:email],
              uid: auth[:uid],
              provider: auth[:provider],
              password: Devise.friendly_token[0,20]
          )
      
    end
end