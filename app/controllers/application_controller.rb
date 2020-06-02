class ApplicationController < ActionController::Base

  def homepage
    render({ :template => "nuvaapp/homepage.html.erb"})

  end


  def tracked
    
    render({ :template => "nuvaapp/tracked.html.erb"})

  end

  def add_row
    # Parameters: {"query_username"=>"raghu"}
    the_un = params.fetch("useremail")

    u = User.new
    u.useremail = the_un

    u.save

    redirect_to("/tracked", { :notice => "Date added successfully!" })
    
  end

  def modify
    # Parameters: {"query_username"=>"anisa2", "id_to_modify"=>"117"}

    the_id = params.fetch("id_to_modify")
    all_matches = User.where({ :id => the_id })
    the_user = all_matches.at(0)

    new_username = params.fetch("useremail")

    the_user.username = new_username

    the_user.save

    details_path = "/tracked" + the_user.username

    redirect_to(details_path)

    # render({ :template => "user_templates/update.html.erb" })
  end
end
