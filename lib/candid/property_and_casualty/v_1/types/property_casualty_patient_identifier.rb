# frozen_string_literal: true

module Candid
  module PropertyAndCasualty
    module V1
      module Types
        class PropertyCasualtyPatientIdentifier < Internal::Types::Model
          field :property_casualty_patient_identifier_qualifier, lambda {
            Candid::PropertyAndCasualty::V1::Types::PropertyCasualtyPatientIdentifierQualifier
          }, optional: false, nullable: false
          field :property_casualty_patient_identifier, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
