class GroupsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
	def index 
		@group = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.create(group_params)

		if @group.save
			redirect_to groups_path notice: "新增討論版成功"
		else
			render :new
		end
	end

	def show
		@group = Group.find(params[:id])
		@posts = @group.posts
	end

	def edit
		@group = Group.find(params[:id])
	end

	def update
	    @group = Group.find(params[:id])

	    if @group.update(group_params)
	    	redirect_to groups_path notice: "修改討論版成功"
	    else
	    	render :edit
	    end
	end
	def destroy
		@group = Group.find(params[:id])
		@group.destroy
		redirect_to groups_path alert: "刪除討論版成功"
	end
	private

	def group_params
		params.require(:group).permit(:title, :description)
	end

end