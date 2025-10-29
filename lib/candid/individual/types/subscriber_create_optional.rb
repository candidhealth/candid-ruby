# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class SubscriberCreateOptional < Internal::Types::Model
        field :insurance_card, lambda {
          Candid::InsuranceCards::V2::Types::InsuranceCardCreateOptional
        }, optional: true, nullable: false
      end
    end
  end
end
