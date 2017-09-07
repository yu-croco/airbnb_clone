class Photo < ActiveRecord::Base
	belongs_to :listing, optional: true

	has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" },
		default_url: "house-default.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
