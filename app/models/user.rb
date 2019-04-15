class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attachment :thumbnail

  has_many :joins,dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :authorizations

  belongs_to :area

  acts_as_followable
  acts_as_follower

  devise	:database_authenticatable,
  				:registerable,
        	:recoverable,
        	:rememberable,
        	# :trackable,
        	:validatable,
          # :timeoutable,
        	:omniauthable



  # UserモデルにSNS認証が要求されたときにユーザーを生成する機能
  def self.find_for_oauth(auth)
    user ||= User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      if auth.provider == "twitter"
        user ||= User.create( uid: auth.uid,
                            provider: auth.provider,
                            nickname: auth.info.name,
                            thumbnail_id: auth.info.image,
                            provider_url: auth.info.urls.Twitter,
                            description: auth.info.description,
                            area_id: 9,
                            email: User.dummy_email(auth),
                            password: Devise.friendly_token[0, 20]
        )
      else
        # provider = facebook
        user ||= User.create( uid: auth.uid,
                            provider: auth.provider,
                            nickname: auth.info.name,
                            thumbnail_id: auth.info.image,
                            provider_url: auth.extra.raw_info.link,
                            description: "自己紹介文はありません",
                            area_id: 9,
                            email: User.dummy_email(auth),
                            password: Devise.friendly_token[0, 20]
        )
      end
    end
    return user

  end

  def list_up(user)
    self.where(user_id: user)
  end

  private


  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
