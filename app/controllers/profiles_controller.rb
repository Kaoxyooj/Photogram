class ProfilesController < ApplicationController
	before_action :set_user
	# after_action  :posts
	before_action :owned_profile, only: [:edit, :update]
	after_action :followers, only:[:set_user]
	before_action :authenticate_user!

	def show 
  		@posts = @user.posts.order('created_at DESC')
	end 

	def following
	end

	def followers
	end

	def posts
		@posts = @user.posts.order('created_at DESC')
	end

	def edit
	end

	def update
		if @user.update(profile_params)
			flash[:success] = "Your profile has been updated."
			redirect_to profile_path(@user.user_name)
		else
			@user.errors.full_messages
			flash.now[:error] = @user.errors.full_messages
			render :edit
		end
	end

  	private
  	def profile_params
  		params.require(:user).permit(:avatar, :bio)
  	end

  	def set_user
  		@user = User.find_by_user_name(params[:user_name]) 
  	end

  	def owned_profile
  		@user
  		unless current_user == @user
  			flash[:alert] = "That profile doesn't belong to you!"
  			redirect_to root_path
  		end
  	end
end
