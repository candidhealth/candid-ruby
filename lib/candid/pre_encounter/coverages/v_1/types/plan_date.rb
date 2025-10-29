# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class PlanDate < Internal::Types::Model
            field :start_date, -> { String }, optional: false, nullable: false
            field :end_date, -> { String }, optional: true, nullable: false
            field :field_name, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
