# frozen_string_literal: true

module Candid
  module PayerPlanGroups
    module V1
      module Types
        class MutablePayerPlanGroup < Internal::Types::Model
          field :plan_group_name, -> { String }, optional: false, nullable: false
          field :payer_uuid, -> { String }, optional: false, nullable: false
          field :plan_type, -> { Candid::Commons::Types::SourceOfPaymentCode }, optional: false, nullable: false

        end
      end
    end
  end
end
