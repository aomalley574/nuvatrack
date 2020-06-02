Rails.application.routes.draw do

get("/", { :controller => "application", :action => "homepage" })

get("/tracked", { :controller => "application", :action => "tracked" })

get("/insert_nuva_cycle", { :controller => "application", :action => "add_row" })

end
