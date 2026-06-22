# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # The date range for the service. If not specified, Stedi defaults to the current date.
          # You can specify either a single date_of_service or a beginning_date_of_service and end_date_of_service.
          class InsuranceDiscoveryEncounter < Internal::Types::Model
            field :date_of_service, -> { String }, optional: true, nullable: false
            field :beginning_date_of_service, -> { String }, optional: true, nullable: false
            field :end_date_of_service, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
