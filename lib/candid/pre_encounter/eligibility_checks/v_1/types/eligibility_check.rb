# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityCheck < Internal::Types::Model
            field :batch_id, -> { String }, optional: true, nullable: false
            field :errors, lambda {
              Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckError]
            }, optional: true, nullable: false
            field :request, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest
            }, optional: true, nullable: false
            field :response, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
            field :parsed_response, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::ParsedResponse
            }, optional: true, nullable: false
            field :request_corrections, lambda {
              Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::RequestCorrection]
            }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
