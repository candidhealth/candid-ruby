# frozen_string_literal: true

module Candid
  module Financials
    module Types
      # Error content when a reallocation would cause an account to be overdrafted.
      # Contains both legacy string messages and new structured allocation details.
      class ReallocationWouldOverdraftErrorContent < Internal::Types::Model
        field :messages, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        field :allocation_details, -> { Internal::Types::Array[Candid::Financials::Types::AllocationOverdraftDetail] }, optional: true, nullable: false
      end
    end
  end
end
