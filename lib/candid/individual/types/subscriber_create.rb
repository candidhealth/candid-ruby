# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class SubscriberCreate < Internal::Types::Model
        field :insurance_card, -> { Candid::InsuranceCards::V2::Types::InsuranceCardCreate }, optional: false, nullable: false

      end
    end
  end
end
