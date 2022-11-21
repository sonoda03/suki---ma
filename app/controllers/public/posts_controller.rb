class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :search_tag,]
  # 検索
  before_action :set_q, only: [:new, :index, :show, :create, :search, :search_tag]

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @posts = @genre.posts
    else
      @posts = Post.page(params[:page])
    end
  end


  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @post_comment = PostComment.new
    @genres = Genre.all
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
    if @post.user == current_user
      render "edit"
    else
      redirect_to post_path(@post)
    end
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

  # 投稿詳細検索
  def search
    @results = @q.result.page(params[:page])
    @genres = Genre.all
  end

  # タグ検索
  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.page(params[:page])
  end

  private

  # 検索
  def set_q
    @q = Post.ransack(params[:q])
  end


  def post_params
    params.require(:post).permit(:user_id, :genre_id, :title, :introduction, :post_image, :url)
  end
end
