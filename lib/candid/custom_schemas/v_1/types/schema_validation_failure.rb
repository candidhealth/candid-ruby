# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class SchemaValidationFailure < Internal::Types::Model
          field :errors, lambda {
            Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaValidationError]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
