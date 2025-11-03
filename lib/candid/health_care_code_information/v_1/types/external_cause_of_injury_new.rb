# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to BN or ABN code qualifier values.
        class ExternalCauseOfInjuryNew < Internal::Types::Model
          field :external_cause_of_injury_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjuryCodeQualifier
          }, optional: false, nullable: false
          field :external_cause_of_injury_code, -> { String }, optional: false, nullable: false
          field :present_on_admission_indicator, lambda {
            Candid::HealthCareCodeInformation::V1::Types::PresentOnAdmissionIndicatorCode
          }, optional: true, nullable: false
        end
      end
    end
  end
end
