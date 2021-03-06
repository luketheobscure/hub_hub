class CommentsController < ApplicationController
  # Devise filter
  before_filter :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @current_user = current_user
    @comment = Comment.build_from(@post, @current_user.id, params[:comment][:body])
    @comment.save

    if params[:parent_type] == "comment" && @comment.persisted?
      parent_comment = Comment.find(params[:parent_id])
      @comment.move_to_child_of(parent_comment)
      @comment.save
    end

    redirect_to spoke_post_path(@post.spoke, @post)
  end

  def edit
    @comment = Comment.find(params[:id])

    if current_user == @comment.user
      respond_to do |format|
        format.html
      end
    else
      respond_to do |format|
        format.html {
          redirect_to spoke_post_comment_url(@comment.post.spoke,
            @comment.post, @comment),
            notice: "You must have created the comment to be able to edit it."
        }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    unless current_user == @comment.user
      respond_to do |format|
        format.html {
          redirect_to spoke_post_url(@comment.post.spoke, @comment.post),
            notice: "You must have created the comment to be able to update it."
        }

      end
      return
    end

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html {
          redirect_to spoke_post_path(@comment.post.spoke, @comment.post),
            notice: 'Comment was successfully updated.'
        }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def flag
    @comment = Comment.find(params[:comment_id])

    if params[:flag_type]
      current_user.toggle_flag(@comment, params[:flag_type])
    end

    respond_to do |format|
      format.js
    end
  end
end
