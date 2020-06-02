Rails.application.routes.draw do

get("/", { :controller => "application", :action => "homepage" })

get("/tracked", { :controller => "application", :action => "tracked" })

end
