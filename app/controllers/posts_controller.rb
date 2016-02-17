class PostsController < ApplicationController
	before_action :find_group
	before_action :authenticate_user!
	def new
		@post = @group.posts.new
	end

	def create
	  @post = @group.posts.create(post_params)

		if @post.save
			redirect_to group_path(@group), notice: "新增文章成功!"
		else
			render :new
		end
	end

	def edit
	  @post = @group.posts.find(params[:id])
	end

	def update
	  @post = @group.posts.find(params[:id])

	  if @post.update(post_params)
	  	redirect_to group_path(@group), notice: "修改文章成功"
	  else
	  	render :edit
	  end
	end

	def destroy
	  @post = @group.posts.find(params[:id])
      @post.destroy
      redirect_to group_path(@group), alert: "刪除文章成功"
  end

	private

	def find_group
		@group = Group.find(params[:group_id])
	end

	def post_params
      params.require(:post).permit(:content)
	end

end
