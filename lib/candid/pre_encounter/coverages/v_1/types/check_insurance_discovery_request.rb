# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CheckInsuranceDiscoveryRequest < Internal::Types::Model
            field :patient_id, -> { String }, optional: false, nullable: false
            field :date_of_service, -> { String }, optional: false, nullable: false
            field :npi, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
