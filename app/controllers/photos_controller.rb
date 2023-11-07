class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :asc})
    render ({:template => "photo_templates/index"})
  end

  def show
    this_id = params.fetch("path_id")
    matching_photo = Photo.where({:id => this_id})
    @the_photo = matching_photo.first
    @matching_comments = Comment.where({:photo_id => this_id})
    render ({:template => "photo_templates/show"})
  end
end
