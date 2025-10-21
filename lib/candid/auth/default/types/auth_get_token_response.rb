# frozen_string_literal: true

module Candid
  module Auth
    module Default
      module Types
        class AuthGetTokenResponse < Internal::Types::Model
          field :access_token, -> { String }, optional: false, nullable: false
          field :expires_in, -> { Integer }, optional: false, nullable: false
          field :token_type, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
