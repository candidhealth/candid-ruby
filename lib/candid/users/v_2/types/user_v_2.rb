# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class UserV2 < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :idp_metadata, lambda {
            Internal::Types::Array[Candid::Users::V2::Types::IdpUserMetadata]
          }, optional: false, nullable: false
          field :primary_organization_id, -> { String }, optional: true, nullable: false
          field :user_metadata, -> { Candid::Users::V2::Types::UserMetadata }, optional: false, nullable: false
        end
      end
    end
  end
end
