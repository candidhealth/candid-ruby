# frozen_string_literal: true

module Candid
  module PreServiceRules
    module V1
      module Types
        # An error that prevented a pre-service run from completing.
        class PreServiceError < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
