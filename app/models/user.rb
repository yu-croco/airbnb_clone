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

	# storage for user images or listing images
	if Rails.env.production?
		has_attached_file :image, storage: :s3, s3_credentials: S3_CREDENTIALS,
			default_url: "avatar-default.png",
			style: { medium: "400x400>", thumb: "100x100>"}
		validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	else
		has_attached_file :image, style: { medium: "400x400>", thumb: "100x100>"},
			default_url: "avatar-default.png"
		validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	end
end
