# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class GetEligibilityTimelineRequest < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :event_types, -> { Candid::PreEncounter::Patients::V1::Types::EligibilityAuditEventType }, optional: true, nullable: false
            field :coverage_id, -> { String }, optional: true, nullable: false
            field :appointment_id, -> { String }, optional: true, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false
            field :limit, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
