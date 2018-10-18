class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile update"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to users_url
  end

  def following
    @title = "following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render "show_follow"
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # filters
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to edit_user_path(current_user)
      flash[:warning] = "Please edit your account only"
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
