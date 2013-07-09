class FacebookApi

  class << self

    def graph(facebook_oauth_token)
      Koala::Facebook::API.new(facebook_oauth_token)
    end
  end
end