Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['google_client_id'], ENV['gooogle_client_secret']
end