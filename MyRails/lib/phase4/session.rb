require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    attr_accessor :req_values
    def initialize(req)
      req.cookies.each do |cookie|
        if cookie.name == '_rails_lite_app'
          @req_values = JSON.parse(cookie.value)
        end
      end
      @req_values ||={}
    end

    def [](key)
      req_values[key]
    end

    def []=(key, val)
      req_values[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      res.cookies << WEBrick::Cookie.new('_rails_lite_app', req_values.to_json)
    end
  end
end
