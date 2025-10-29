# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class SchemaValidationError < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member lambda {
            Candid::CustomSchemas::V1::Types::SchemaWithNameAlreadyExistsError
          }, key: "SCHEMA_NAME_ALREADY_EXISTS"
          member -> { Candid::CustomSchemas::V1::Types::KeyWithNameAlreadyExistsError }, key: "KEY_NAME_ALREADY_EXISTS"
        end
      end
    end
  end
end
