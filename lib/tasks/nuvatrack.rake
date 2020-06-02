# Retrieve your credentials from secure storage
mg_api_key = ENV.fetch("MAILGUN_API_KEY")
mg_sending_domain = ENV.fetch("MAILGUN_SENDING_DOMAIN")

# Create an instance of the Mailgun Client and authenticate with your API key
mg_client = Mailgun::Client.new(mg_api_key)

# Craft your email as a Hash with these four keys
email_parameters =  { 
  :from => "Amanda@NuvaTrack.com",
  :to => "amanda.omalley@kellogg.northwestern.edu",  # Put your own email address here if you want to see it in action
  :subject => "Don't forget to remove your Nuva Ring!",
  :text => "Don't forget to remove your Nuva Ring!"
}

# Send your email!
mg_client.send_message(mg_sending_domain, email_parameters)
