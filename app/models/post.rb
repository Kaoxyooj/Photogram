class Post < ActiveRecord::Base
	scope :of_followed_users, -> (following_users) { where user_id: following_users }  

	acts_as_votable

	validates :image, presence: true
	validates :user_id, presence: true
	validates :caption, length: { minumim: 3, maximum: 300 }


	belongs_to :user

	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

  	has_attached_file :image, styles: { :small => "150x150>", :medium => "320x320>", :large => "641x641>", :thumb => "50x"}
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
