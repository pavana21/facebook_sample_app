class User < ActiveRecord::Base
  attr_accessible :bio, :gender, :hometown, :location, :name, :username, :access_token
  validates_presence_of :access_token

  def facebook_user_details(access_token)
    graph = FacebookApi.graph(access_token)
  end
end
