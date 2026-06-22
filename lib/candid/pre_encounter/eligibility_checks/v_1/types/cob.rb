# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An overview of the COB response. Indicates whether there is a coverage overlap, whether that
          # overlap creates a coordination of benefits instance, and whether Stedi was able to identify
          # payer primacy (when a COB instance exists).
          class Cob < Internal::Types::Model
            field :classification, -> { String }, optional: true, nullable: false
            field :instance_exists, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :primacy_determined, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :coverage_overlap, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :benefit_overlap, -> { Internal::Types::Boolean }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
