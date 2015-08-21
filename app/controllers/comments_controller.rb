class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      create_redirect(@comment)
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
    @comment = Comment.includes(:post).find(params[:id])
    @comment_hash = @comment.post.comments_by_parent_id
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    redirect_to post_url(@comment.post_id)
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote!
    create_redirect(@comment)
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote!
    create_redirect(@comment)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

  def create_redirect(comment)
    if comment.parent_comment_id.nil?
      redirect_to post_url(comment.post_id)
    else
      redirect_to post_comment_url(comment.post_id, comment.parent_comment_id)
    end
  end
end
