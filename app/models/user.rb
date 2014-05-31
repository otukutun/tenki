class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name

  valdiates :provider, presence: :true
  valdiates :uid, presence: :true
  valdiates :name, presence: :true

  validates_uniqueness_of :uid, scope: :provider

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]

      if user.provider != "twitter"
        user.name = auth["info"]["name"]
      else
        user.name = auth["info"]["nichname"]
      end
    end
  end

end
