Rails.application.routes.draw do

get("/", { :controller => "application", :action => "homepage" })

get("/tracked", { :controller => "application", :action => "tracked" })

get("/processemail", { :controller => "application", :action => "processemail" })

end
