class User < ActiveRecord::Base
		# Include default devise modules. Others available are:
		# :confirmable, :lockable, :timeoutable and :omniauthable
		devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :trackable, :validatable, :omniauthable

		has_many :listings, dependent: :destroy
		has_many :reservations, dependent: :destroy

		def self.from_omniauth(auth)
			where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
				user.email = auth.info.email
				user.password = Devise.friendly_token[0,20]
				user.name = auth.info.name
				user.image = "http://graph.facebook.com/#{auth.uid}/picture?type=large"
			end
		end
end
