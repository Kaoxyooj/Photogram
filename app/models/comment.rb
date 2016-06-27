class Comment < ActiveRecord::Base
	validates :content, length: { minumim: 3, maximum: 300 }

    belongs_to :user
    belongs_to :post
end
