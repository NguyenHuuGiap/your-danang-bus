class AccessToken < ApplicationRecord
  belongs_to :user

  validates :token, presence: true, uniqueness: true, strict: Errors::TokenGenerationException

  class << AccessToken

    def create_or_refresh_token!(user)
      access_token = user.access_token || user.build_access_token
      begin
        access_token.assign_attributes(token: User.new_token)
        access_token.save!
      rescue Errors::TokenGenerationException
        retry
      end
      access_token.token
    end

    def generate(options = {})
      SecureRandom.hex(16) || options.hash
    end

  end
end
