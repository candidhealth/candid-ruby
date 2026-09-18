# frozen_string_literal: true

module Candid
  module Views
    module Dynamic
      module V1
        module Types
          class ResolveDynamicView < Internal::Types::Model
            field :claim_dynamic_view_id, -> { String }, optional: false, nullable: false
            field :limit, -> { Integer }, optional: true, nullable: false
            field :filters, -> { Candid::EncounterSummaries::V1::Types::EncounterFilter }, optional: true, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false
            field :sort, -> { Internal::Types::Array[Candid::EncounterSummaries::V1::Types::SortCriterion] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
