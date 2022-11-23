class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @q = Post.ransack(params[:q])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def unsubscribe
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :nickname, :email, :introduction, :profile_image)
  end
end
