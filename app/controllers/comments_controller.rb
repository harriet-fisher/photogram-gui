class CommentsController < ApplicationController
  def add
    c = Comment.new
    c.photo_id = params.fetch("photo")
    c.author_id = params.fetch("author")
    c.body = params.fetch("body")
    c.save
    redirect_to("/photos/#{c.photo_id}")
  end
end
