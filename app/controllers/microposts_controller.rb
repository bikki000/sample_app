class MicropostsController < ApplicationController
	before_action :signed_in_user, only: [:craete, :destroy]
	before_action :correct_user, only: :destroy

	def index
	end

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_to :back
	end

	private
	def micropost_params
		params.require(:micropost).permit(:content)
	end
	def correct_user
		unless current_user.micropost_ids.include?(params[:id].to_i)
			flash[:danger] = "You can delete your microposts only"
			redirect_to :back and return
		end
		@micropost = current_user.microposts.find_by(id: params[:id])
		if @micropost.nil?
			flash[:danger] = "You do not have anymore microposts"
			redirect_to :back
		end
	end
end