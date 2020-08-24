require 'unsplash'

Unsplash.configure do |config|
  config.application_access_key = ENV["UNSPLASH_ACCESS_KEY"]
  config.utm_source             = "exts-fullstack"
end
