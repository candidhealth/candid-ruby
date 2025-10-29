# frozen_string_literal: true

module Candid
  module Payers
    module V4
      module Types
        class PrimaryPayerIds < Internal::Types::Model
          field :claims_payer_id, -> { String }, optional: false, nullable: false
          field :eligibility_payer_id, -> { String }, optional: true, nullable: false
          field :remittance_payer_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
