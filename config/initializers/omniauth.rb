Rails.application.config.middleware.use OmniAuth::Builder do

  #provider :developer unless Rails.env.production?
  provider :twitter, MY_APP['twitter_key'], MY_APP['twitter_secret']
end
