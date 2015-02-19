require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: 'users/1/contacts/1/fav.json'
  ).to_s

  puts RestClient.get(
  url,
  )
end

create_user
