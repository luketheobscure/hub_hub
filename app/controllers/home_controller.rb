class HomeController < ApplicationController
  def index
    @posts = Post.last(25)
    @spokes = Spoke.all
  end

  def tos
    #
  end
end
