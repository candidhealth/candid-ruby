# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoveragesGetHistoryRequest < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :start, -> { String }, optional: true, nullable: false
            field :end_, -> { String }, optional: true, nullable: false
            field :non_auto_updated_coverages_only, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :sort_direction, lambda {
              Candid::PreEncounter::Common::Types::SortDirection
            }, optional: true, nullable: false
            field :limit, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
