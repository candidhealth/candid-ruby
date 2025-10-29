# frozen_string_literal: true

module Candid
  module PayerPlanGroups
    module V1
      module Types
        class PayerPlanGroupGetMultiRequest < Internal::Types::Model
          field :plan_group_name, -> { String }, optional: true, nullable: false
          field :payer_uuid, -> { String }, optional: true, nullable: false
          field :payer_id, -> { String }, optional: true, nullable: false
          field :plan_type, -> { Candid::Commons::Types::SourceOfPaymentCode }, optional: true, nullable: false
          field :is_active, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :payer_plan_group_id, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :sort_by_similarity, -> { String }, optional: true, nullable: false
          field :sort, lambda {
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroupSortField
          }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
