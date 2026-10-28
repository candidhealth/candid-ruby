# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class AuditPatientSelfPayUpdated < Internal::Types::Model
            field :from_self_pay, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :to_self_pay, -> { Internal::Types::Boolean }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
