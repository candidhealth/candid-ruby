# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CheckEligibilityRequest < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :service_code, lambda {
              Candid::PreEncounter::Coverages::V1::Types::ServiceTypeCode
            }, optional: false, nullable: false
            field :date_of_service, -> { String }, optional: false, nullable: false
            field :npi, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
