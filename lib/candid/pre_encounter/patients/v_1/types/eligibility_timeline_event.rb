# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          # A single eligibility audit event.
          class EligibilityTimelineEvent < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :event_type, -> { Candid::PreEncounter::Patients::V1::Types::EligibilityAuditEventType }, optional: false, nullable: false
            field :patient_id, -> { String }, optional: false, nullable: false
            field :coverage_id, -> { String }, optional: true, nullable: false
            field :appointment_id, -> { String }, optional: true, nullable: false
            field :timestamp, -> { String }, optional: false, nullable: false
            field :user_id, -> { String }, optional: false, nullable: false
            field :user_name, -> { String }, optional: false, nullable: false
            field :payload, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
