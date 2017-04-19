class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  attr_accessor :remember_token
  has_one :user_location, dependent: :destroy
  has_one :access_token, dependent: :destroy
  has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 50},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.avatar_file_name = auth.info.image
        user.skip_confirmation!
      end
    end
  end
end
