class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  has_many :posts
  has_many :comments
  has_many :favorites
  has_many :favposts, through: :favorites, source: :post

  def like(post)
    favorites.find_or_create_by(post_id: post.id)
  end

  def unlike(post)
    favorite = favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end

  def  favpost?(post)
    self.favposts.include?(post)
  end
  def remember_me
    true
  end
  def self.from_omniauth(auth)
    # user = User.where(uid: auth.uid, provider: auth.provider).first
    user = User.where(email: auth.info.email).first_or_initialize
    uid = auth.uid
    provider = auth.provider
    sns_credential_record = SnsCredential.where(uid: uid, provider: provider).first
    # sns_credential_record = SnsCredential.where(provider: auth.provider, uid: auth.uid)
    if user.present?
      unless sns_credential_record.present?
        SnsCredential.create(
          user_id: user.id,
          provider: auth.provider,
          uid: auth.uid
        )
      end
    else
      user = User.new(
        id: User.all.last.id + 1,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
        nickname: auth.info.name,
        first_name: auth.info.last_name,
        family_name: auth.info.first_name,
      )
      SnsCredential.new(
        provider: auth.provider,
        uid: auth.uid,
        user_id: user.id
      )
    end 
  user
  end
end
