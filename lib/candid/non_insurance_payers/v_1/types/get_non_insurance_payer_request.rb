# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      module Types
        class GetNonInsurancePayerRequest < Internal::Types::Model
          field :non_insurance_payer_id, -> { String }, optional: false, nullable: false
          field :organization_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
