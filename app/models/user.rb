class User < ActiveRecord::Base
  attr_accessible :bio, :gender, :hometown, :location, :name, :username, :access_token

  def facebook_user_details(access_token)
    graph = FacebookApi.graph(access_token)
    profile_details = graph.get_object("me")
    self.username = profile_details["username"]
    self.location = profile_details["location"]["name"]
    self.name = profile_details["name"]
    self.gender = profile_details["gender"]
    self.hometown = profile_details["hometown"]["name"]
    self.bio = profile_details["bio"]
  end
end
