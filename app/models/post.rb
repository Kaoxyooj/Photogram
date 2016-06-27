class Post < ActiveRecord::Base
	validates :image, presence: true
	validates :user_id, presence: true

	belongs_to :user

  	has_attached_file :image, styles: { :small => "150x150>", :medium => "320x320>", :large => "641x641>", :thumb => "50x"}
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
