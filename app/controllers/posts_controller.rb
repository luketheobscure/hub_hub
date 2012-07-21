class PostsController < ApplicationController
  def create
    @spoke = Spoke.find(params[:spoke_id])
    @post = @spoke.posts.create(params[:post])
    redirect_to spoke_path(@spoke)
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
end
