# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class AuthZeroMetadata < Internal::Types::Model
          field :auth_0_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
