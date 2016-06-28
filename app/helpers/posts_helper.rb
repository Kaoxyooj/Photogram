module PostsHelper
	def likers_of(post)
		votes = post.votes_for.up.by_type(User)
		user_names = []
		unless votes.blank?
			votes.voters.each do |voter|
				user_names.push(link_to voter.user_name, profile_path(voter.user_name), class: "user_name")
			end
			user_names.to_sentence.html_safe + like_plural(votes) if votes.count <= 1
			count_likers(votes, post)			
		end
	end

	def liked_post(post)
		return "glyphicon-heart" if current_user.voted_for? post
		"glyphicon-heart-empty"
	end

	private
	def like_plural(votes)
		return " like this" if votes.count <= 1
		" likes this"
	end

	def count_likers(votes, post)
		j = votes.count
		return link_to post.user.user_name, profile_path(post.user.user_name)+ "and #{j}" if current_user.voted_for? post
	end
end
