# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the BI code qualifier value.
        class OccurrenceSpanInformation < Internal::Types::Model
          field :occurrence_span_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::OccurrenceSpanCodeQualifier
          }, optional: false, nullable: false
          field :occurrence_span_code, lambda {
            Candid::HealthCareCodeInformation::V1::Types::OccurrenceSpanCode
          }, optional: false, nullable: false
          field :occurrence_span_date, lambda {
            Candid::HealthCareCodeInformation::V1::Types::Rd8Date
          }, optional: false, nullable: false
        end
      end
    end
  end
end
