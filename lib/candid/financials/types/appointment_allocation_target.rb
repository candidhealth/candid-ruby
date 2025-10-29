# frozen_string_literal: true

module Candid
  module Financials
    module Types
      class AppointmentAllocationTarget < Internal::Types::Model
        field :appointment_id, -> { String }, optional: false, nullable: false
        field :patient_external_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
