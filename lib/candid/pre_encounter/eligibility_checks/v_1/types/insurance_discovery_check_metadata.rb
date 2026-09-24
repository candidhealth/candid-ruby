# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class InsuranceDiscoveryCheckMetadata < Internal::Types::Model
            field :check_id, -> { String }, optional: false, nullable: false
            field :status, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::InsuranceDiscoveryStatus }, optional: false, nullable: false
            field :initiated_by, -> { String }, optional: false, nullable: false
            field :initiated_at, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
