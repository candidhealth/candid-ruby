# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class AdditionalPayerInformation < Internal::Types::Model
          field :availity_eligibility_id, -> { String }, optional: true, nullable: false
          field :availity_payer_id, -> { String }, optional: true, nullable: false
          field :availity_payer_name, -> { String }, optional: true, nullable: false
          field :availity_remittance_payer_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
