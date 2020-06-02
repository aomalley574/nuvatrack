class ApplicationController < ActionController::Base

  def homepage
    render({ :template => "nuvaapp/homepage.html.erb"})

  end


  def tracked
    
    render({ :template => "nuvaapp/tracked.html.erb"})
  end

end
