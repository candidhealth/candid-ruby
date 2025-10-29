# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityCheckMetadata < Internal::Types::Model
            field :check_id, -> { String }, optional: false, nullable: false
            field :service_code, lambda {
              Candid::PreEncounter::Coverages::V1::Types::ServiceTypeCode
            }, optional: false, nullable: false
            field :status, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckStatus
            }, optional: false, nullable: false
            field :initiated_by, -> { String }, optional: false, nullable: false
            field :initiated_at, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
