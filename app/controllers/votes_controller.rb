class VotesController < ApplicationController
  def upvote
    @item_type = params[:item_type]
    @item = instance_eval "#{@item_type.capitalize}.find #{params[:item_id]}"

    if current_user.voted_up_on? @item
      current_user.unvote_for @item
    else
      @item.liked_by current_user
    end

    @upvote_count = @item.likes.size.to_s
    @downvote_count = @item.dislikes.size.to_s
    @total_vote_count = (@upvote_count.to_i - @downvote_count.to_i).to_s

    respond_to do |format|
      format.js
    end
  end

  def downvote
    @item_type = params[:item_type]
    @item = instance_eval "#{@item_type.capitalize}.find #{params[:item_id]}"

    if current_user.voted_down_on? @item
      current_user.unvote_for @item
    else
      @item.downvote_from current_user
    end

    @upvote_count = @item.likes.size.to_s
    @downvote_count = @item.dislikes.size.to_s
    @total_vote_count = (@upvote_count.to_i - @downvote_count.to_i).to_s

    respond_to do |format|
      format.js
    end
  end
end
