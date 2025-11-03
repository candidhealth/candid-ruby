# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the BH code qualifier value.
        class OccurrenceInformationNew < Internal::Types::Model
          field :occurrence_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::OccurrenceInformationCodeQualifier
          }, optional: false, nullable: false
          field :occurrence_code, lambda {
            Candid::HealthCareCodeInformation::V1::Types::OccurrenceCode
          }, optional: false, nullable: false
          field :occurrence_date, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
