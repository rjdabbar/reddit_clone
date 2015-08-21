class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def update
    @comment = Comment.includes(:post).find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment edited!"
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      render :edit
    end
  end

  def show
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
