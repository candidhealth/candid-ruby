# frozen_string_literal: true

module Candid
  module PropertyAndCasualty
    module V1
      module Types
        class PropertyCasualtyPatientIdentifierCreateOptional < Internal::Types::Model
          field :property_casualty_patient_identifier_qualifier, -> { Candid::PropertyAndCasualty::V1::Types::PropertyCasualtyPatientIdentifierQualifier }, optional: true, nullable: false
          field :property_casualty_patient_identifier, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
