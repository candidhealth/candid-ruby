# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class InsurancePlan < Internal::Types::Model
            field :member_id, -> { String }, optional: false, nullable: false
            field :payer_id, -> { String }, optional: false, nullable: false
            field :payer_name, -> { String }, optional: false, nullable: false
            field :additional_payer_information, -> { Candid::PreEncounter::Common::Types::AdditionalPayerInformation }, optional: true, nullable: false
            field :group_number, -> { String }, optional: true, nullable: false
            field :name, -> { String }, optional: true, nullable: false
            field :plan_type, -> { Candid::PreEncounter::Coverages::V1::Types::NetworkType }, optional: true, nullable: false
            field :type, -> { Candid::PreEncounter::Coverages::V1::Types::InsuranceTypeCode }, optional: true, nullable: false
            field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false
            field :insurance_card_image_locator, -> { String }, optional: true, nullable: false
            field :payer_plan_group_id, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
