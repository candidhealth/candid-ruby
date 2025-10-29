# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class OtherIdpMetadata < Internal::Types::Model
          field :idp_external_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
