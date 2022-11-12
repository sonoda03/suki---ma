class Public::PostsController < ApplicationController
  
  def index
    @post = Post.all
  end


  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    # if
      @post.save
      flash[:notice] = "投稿しました。"
      redirect_to post_path(@post)
    # else
    #   render 'new'
    # end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を更新しました。"
      redirect_to post_path(@post.id)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy(post_params)
      flash[:notice] = "投稿を削除しました。"
      render customers_my_page_path
  end

  private

  def post_params
    params.require(:post).permit(:customer_id, :genre_id, :title, :introduction, :post_image, :url)
  end
end
