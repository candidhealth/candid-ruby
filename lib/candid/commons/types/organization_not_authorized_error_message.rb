# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class OrganizationNotAuthorizedErrorMessage < Internal::Types::Model
        field :message, -> { String }, optional: false, nullable: false

      end
    end
  end
end
