Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})
  post("/update_user/:path_username", {:controller => "users", :action => "update"})
  post("/add_user", {:controller => "users", :action => "add"})

  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:path_id", {:controller => "photos", :action => "show"})
  post("/add_photo", {:controller => "photos", :action => "add"})
  post("/edit_photo/:path_id", {:controller => "photos", :action => "edit"})
end
