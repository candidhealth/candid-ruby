# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class SchemaInstanceValidationFailure < Internal::Types::Model
          field :errors, lambda {
            Internal::Types::Array[Candid::Encounters::V4::Types::SchemaInstanceValidationError]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
