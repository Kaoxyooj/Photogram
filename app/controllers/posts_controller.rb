class PostsController < ApplicationController
	before_action :set_post, only: [:showm :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@post.save
		redirect_to posts_path
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
			redirect_to :action => "show", :id => @post
		else
			render :action => "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id]).destroy
		redirect_to :action => "index"
	end

private
	def post_params
		params.require(:post).permit(:image, :caption)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
