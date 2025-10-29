# frozen_string_literal: true

module Candid
  module Auth
    module Default
      module Types
        class AuthGetTokenRequest < Internal::Types::Model
          field :client_id, -> { String }, optional: false, nullable: false
          field :client_secret, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
