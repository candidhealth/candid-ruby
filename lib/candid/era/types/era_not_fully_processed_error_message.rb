# frozen_string_literal: true

module Candid
  module Era
    module Types
      class EraNotFullyProcessedErrorMessage < Internal::Types::Model
        field :claim_id, -> { String }, optional: false, nullable: false
        field :message, -> { String }, optional: false, nullable: false

      end
    end
  end
end
