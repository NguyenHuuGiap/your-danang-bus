class AccessToken < ApplicationRecord
  belongs_to :user

  validates :token, presence: true, uniqueness: true, strict: Errors::TokenGenerationException

  class << AccessToken

    def create_or_refresh_token!(user)
      access_token = user.access_token || user.build_access_token
      begin
        access_token.assign_attributes(token: generate(user.email))
        access_token.save!
      rescue Errors::TokenGenerationException
        retry
      end
      access_token.token
    end

    def generate(options = {})
      SecureRandom.hex(60) << Digest::MD5.hexdigest(options.hash.to_s)[0, 4]
    end

  end
end
