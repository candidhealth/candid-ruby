# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageValue < Internal::Types::Model
            field :family, -> { Integer }, optional: true, nullable: false
            field :individual, -> { Integer }, optional: true, nullable: false
            field :employee_and_spouse, -> { Integer }, optional: true, nullable: false
            field :employee_and_children, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
