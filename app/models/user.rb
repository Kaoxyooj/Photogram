class User < ActiveRecord::Base
	acts_as_voter

	has_attached_file :avatar, styles: { :small => "150x150>", :medium => "320x320>", :large => "641x641>", :thumb => "50x"}
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }

	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
