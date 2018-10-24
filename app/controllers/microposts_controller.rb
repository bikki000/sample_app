class MicropostsController < ApplicationController
	before_action :signed_in_user, only: [:craete, :destroy]
	before_action :correct_user, only: :destroy

	def index
	end

	def create
		# binding.pry
		@userable = current_user
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			$pubnub.publish(
				channel: "posts_#{@userable.id}",
				message: {content: micropost_params[:content]}
				)
			puts "\nposts_#{@userable.id}\n\n"
			respond_to do |format|
				format.js { render :nothing => true }
				format.html do
					@feed_items = []
					@feed_items = current_user.feed.paginate(page: params[:page]) if signed_in?
					render 'static_pages/home'		
				end
			end
			# flash[:success] = "Micropost created"
			# redirect_to root_url
		else
			@feed_items = []
			@feed_items = current_user.feed.paginate(page: params[:page]) if signed_in?
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