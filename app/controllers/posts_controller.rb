class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :owned_post, only: [:edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Your post has been created!"
			redirect_to posts_path
		else
			flash[:alert] = "Uh-oh, something went wrong!"
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:success] = "Updated Post!"
			redirect_to posts_path
		else
			flash.now[:alert] = "Uh-oh, something went wrong!"
			render :edit
		end
	end

	def destroy		
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:success] = "You have deleted a post!"
			redirect_to :action => "index"
		else
			flash[:alert] = "Uh-oh, something went wrong!"
			redirect_to :back
		end
	end

private
	def post_params
		params.require(:post).permit(:image, :caption)
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def owned_post
		unless current_user == @post.user
			flash[:alert] = "That post doesn't belong to you!"
			redirect_to root_path
		end
	end
end
