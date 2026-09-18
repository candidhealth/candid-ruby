# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class AuditPatientTagsUpdated < Internal::Types::Model
            field :added, -> { Internal::Types::Array[String] }, optional: true, nullable: false
            field :removed, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
