# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class PayerSearchResponse < Internal::Types::Model
            field :items, lambda {
              Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::StediPayerItem]
            }, optional: false, nullable: false
            field :stats, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
