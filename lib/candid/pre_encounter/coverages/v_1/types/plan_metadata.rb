# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class PlanMetadata < Internal::Types::Model
            field :payer_name, -> { String }, optional: true, nullable: false
            field :insurance_type, -> { String }, optional: true, nullable: false
            field :insurance_type_code, -> { String }, optional: true, nullable: false
            field :plan_name, -> { String }, optional: true, nullable: false
            field :member_id, -> { String }, optional: true, nullable: false
            field :group_number, -> { String }, optional: true, nullable: false
            field :start_date, -> { String }, optional: true, nullable: false
            field :end_date, -> { String }, optional: true, nullable: false
            field :plan_dates, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::PlanDate] }, optional: true, nullable: false
            field :subscriber, -> { Candid::PreEncounter::Coverages::V1::Types::ExpandedMemberInfo }, optional: true, nullable: false
            field :dependent, -> { Candid::PreEncounter::Coverages::V1::Types::ExpandedMemberInfo }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
