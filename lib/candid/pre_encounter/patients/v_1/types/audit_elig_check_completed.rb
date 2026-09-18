# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class AuditEligCheckCompleted < Internal::Types::Model
            field :check_id, -> { String }, optional: false, nullable: false
            field :coverage_id, -> { String }, optional: false, nullable: false
            field :coverage_type, -> { Candid::PreEncounter::Patients::V1::Types::CoverageType }, optional: true, nullable: false
            field :appointment_id, -> { String }, optional: true, nullable: false
            field :run_id, -> { String }, optional: true, nullable: false
            field :status, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckStatus }, optional: false, nullable: false
            field :payer_id, -> { String }, optional: true, nullable: false
            field :payer_name, -> { String }, optional: true, nullable: false
            field :eligibility_status, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus }, optional: true, nullable: false
            field :error_code, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
