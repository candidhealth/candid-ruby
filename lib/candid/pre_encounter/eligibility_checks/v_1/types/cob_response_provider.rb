# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Information about the entity that submitted the original COB request.
          class CobResponseProvider < Internal::Types::Model
            field :provider_name, -> { String }, optional: true, nullable: false
            field :provider_first_name, -> { String }, optional: true, nullable: false
            field :provider_org_name, -> { String }, optional: true, nullable: false
            field :npi, -> { String }, optional: true, nullable: false
            field :aaa_errors, -> { Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
