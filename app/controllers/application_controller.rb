class ApplicationController < ActionController::Base

  def homepage
    render({ :template => "nuvaapp/homepage.html.erb"})

  end


  def tracked
    
    render({ :template => "nuvaapp/tracked.html.erb"})

  end

  def processemail
    require "date"

    params.fetch("useremail")
    useremail = params.fetch("useremail")
    # Parameters: {"useremail"=>"aomalley2370@gmail.com"}


    # Retrieve your credentials from secure storage
    mg_api_key = ENV.fetch("MAILGUN_API_KEY")
    mg_sending_domain = ENV.fetch("MAILGUN_SENDING_DOMAIN")

    # Create an instance of the Mailgun Client and authenticate with your API key
    mg_client = Mailgun::Client.new(mg_api_key)

    # twentyonedatetime = DateTime.current + 21.days
    twentyonedatetime = Date.today + 21.days
    refactoreddatetime21 = twentyonedatetime.strftime("%Y%m%e")

    # thirydatetime = DateTime.current + 30.days
    thirydatetime = Date.today + 30.days
    refactoreddatetime30 = thirydatetime.strftime("%Y%m%e")

    # Craft your email as a Hash with these four keys
    email_parameters =  { 
      :from => "Amanda@NuvaTrack.com",
      :to => useremail,  # Put your own email address here if you want to see it in action
      :subject => "Remove Ring!",
      :text => "
      Hey beautiful! 

      Don't forget to remove your ring today. 
      Then go kick some ass.

      Peace and Love, The Universe

      Remove
      https://calendar.google.com/calendar/render?action=TEMPLATE&text=Remove%20Ring&dates=#{refactoreddatetime21}/#{refactoreddatetime21}&details=Hey%20beautiful!%20%20Don't%20forget%20to%20remove%20your%20ring%20today.%20Peace%20and%20Love,%20The%20Universe&location=Event%20Location&trp=true
      
      Insert
      https://calendar.google.com/calendar/render?action=TEMPLATE&text=Insert%20Ring&dates=#{refactoreddatetime30}/#{refactoreddatetime30}&details=Hey%20beautiful!%20%20Don't%20forget%20to%20insert%20your%20ring%20today.%20Peace%20and%20Love,%20The%20Universe&location=Event%20Location&trp=true
      "
    }

    # Send your email!
    mg_client.send_message(mg_sending_domain, email_parameters)


    redirect_to("/tracked")
  end

  


end
