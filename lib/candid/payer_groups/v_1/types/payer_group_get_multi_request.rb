# frozen_string_literal: true

module Candid
  module PayerGroups
    module V1
      module Types
        class PayerGroupGetMultiRequest < Internal::Types::Model
          field :name, -> { String }, optional: true, nullable: false
          field :payer_group_id, -> { String }, optional: true, nullable: false
          field :payer_plan_group_id, -> { String }, optional: true, nullable: false
          field :min_payer_plan_count, -> { Integer }, optional: true, nullable: false
          field :include_archived, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
