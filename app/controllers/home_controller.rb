class HomeController < ApplicationController
  def index
    @sorter = if params[:sort]
      params[:sort].to_sym
    else
      :newest
    end

    @posts = Post.sort_by @sorter
    @sort_options = Post.sort_options
    @spokes = Spoke.all
  end

  def tos
    #
  end
end
