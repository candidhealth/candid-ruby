# frozen_string_literal: true

module Candid
  module InsuranceCards
    module V2
      module Types
        class InsuranceCardBase < Internal::Types::Model
          field :group_number, -> { String }, optional: true, nullable: false
          field :plan_name, -> { String }, optional: true, nullable: false
          field :plan_type, -> { Candid::Commons::Types::SourceOfPaymentCode }, optional: true, nullable: false
          field :insurance_type, -> { Candid::Commons::Types::InsuranceTypeCode }, optional: true, nullable: false
          field :payer_plan_group_id, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
