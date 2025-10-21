# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class Subscriber < Internal::Types::Model
        field :individual_id, -> { String }, optional: false, nullable: false
        field :insurance_card, -> { Candid::InsuranceCards::V2::Types::InsuranceCard }, optional: false, nullable: false

      end
    end
  end
end
