module ProfilesHelper
	def current_user_is_following(current_user_id, followed_user_id)
    	relationship = Follow.find_by(follower_id: current_user_id, following_id: followed_user_id)
    	return true if relationship
    end

    def follower_count user
    	return link_to "#{user.followers.count}", "#", class: "flw" unless user.followers.count == 0
    	user.followers.count
    end

    def following_count user
    	return link_to "#{@user.following.count}", "#", class: "flwng" unless @user.following.count == 0
    	user.following.count
    end

    def post_count user
    	return link_to "#{@user.posts.count}", "#", class: "post_counter" unless @user.posts.count == 0
    	user.posts.count
    end

end
