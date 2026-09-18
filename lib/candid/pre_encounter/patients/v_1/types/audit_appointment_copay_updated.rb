# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class AuditAppointmentCopayUpdated < Internal::Types::Model
            field :copay_cents, -> { Integer }, optional: false, nullable: false
            field :service, -> { String }, optional: true, nullable: false
            field :appointment_date, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
