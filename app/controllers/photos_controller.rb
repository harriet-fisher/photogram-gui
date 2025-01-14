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
    @matching_comments = @the_photo.comments
    render ({:template => "photo_templates/show"})
  end

  def add
    p = Photo.new
    p.caption = params.fetch("caption")
    p.image = params.fetch("image")
    p.owner_id = params.fetch("id")
    p.save
    redirect_to("/photos/#{p.id}")
  end

  def delete
    the_id = params.fetch("path_id")

    matching_records = Photo.where({ :id => the_id })

    the_photo = matching_records.at(0)

    the_photo.destroy

    redirect_to("/photos")
  end

  def edit
    photo_id = params.fetch("edit_id")
    matching_photos = Photo.where({:id => photo_id})
    the_photo = matching_photos.first
    the_photo.image = params.fetch("query_image")
    the_photo.caption = params.fetch("query_caption")
    the_photo.save
    redirect_to("/photos/#{the_photo.id}")
  end
end
