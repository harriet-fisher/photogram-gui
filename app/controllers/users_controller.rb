class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({:template => "user_templates/index"})
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({:username => url_username})
    @the_user = matching_usernames.first
    if @the_user == nil
      redirect_to("/404")
    else
      render({:template => "user_templates/show"})
    end
  end

  def update
    url_username = params.fetch("path_username")
    matching_usernames = User.where({:username => url_username})
    the_user = matching_usernames.first
    the_user.username = params.fetch("username")
    the_user.save
    redirect_to("/users/#{the_user.username}")
  end

  def add
    u = User.new
    u.username = params.fetch("username")
    u.save
    redirect_to("/users")
  end
end
