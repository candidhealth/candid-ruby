# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageCarveOut < Internal::Types::Model
            field :carve_out, -> { Candid::PreEncounter::Coverages::V1::Types::CarveOutType }, optional: false, nullable: false
            field :member_id, -> { String }, optional: false, nullable: false
            field :payer_id, -> { String }, optional: false, nullable: false
            field :payer_name, -> { String }, optional: false, nullable: false
            field :group_number, -> { String }, optional: true, nullable: false
            field :plan_type, -> { Candid::PreEncounter::Coverages::V1::Types::NetworkType }, optional: true, nullable: false
            field :type, -> { Candid::PreEncounter::Coverages::V1::Types::InsuranceTypeCode }, optional: true, nullable: false
            field :payer_plan_group_id, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
