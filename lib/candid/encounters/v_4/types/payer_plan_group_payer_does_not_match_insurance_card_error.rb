# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class PayerPlanGroupPayerDoesNotMatchInsuranceCardError < Internal::Types::Model
          field :payer_plan_group_payer_uuid, -> { String }, optional: false, nullable: false
          field :insurance_card_payer_uuid, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
