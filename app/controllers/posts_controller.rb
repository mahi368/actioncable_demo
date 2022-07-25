class PostsController < ApplicationController
	def index		
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(title: params[:post][:title], content: params[:post][:content])
		@post.save
		ActionCable.server.broadcast('posts' ,post_id: @post.id, title:  @post.title, content: @post.content)
		redirect_to root_path
	end
end
