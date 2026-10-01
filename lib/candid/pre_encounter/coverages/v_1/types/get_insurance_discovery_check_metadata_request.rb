# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class GetInsuranceDiscoveryCheckMetadataRequest < Internal::Types::Model
            field :patient_id, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
