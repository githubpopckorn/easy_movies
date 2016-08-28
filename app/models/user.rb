class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook, :twitter]
	
  def self.find_or_create_by_omniauth(auth)
	  usuario = User.where(provider: auth[:provider], uid: auth[:uid]).first
	  return usuario if usuario
	  
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
