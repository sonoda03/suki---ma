class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
    @tag_list = Tag.all
  end


  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      flash[:notice] = "投稿しました。"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list=@post.tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
      # 投稿についているタグを一旦全て削徐
      @old_relations=PostTag.where(post_id: @post.id)
      @old_relations.each do |relation|
        relation.delete
      end
      # 再度タグ登録
      @post.save_tag(tag_list)
      flash[:notice] = "投稿を更新しました。"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :genre_id, :title, :introduction, :post_image, :url)
  end
end
