class PostsController < ApplicationController
  def new
    @post = Post.new.tap do |post|
      2.times { post.comments.build }
    end
  end

end
