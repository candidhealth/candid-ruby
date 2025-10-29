# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class SchemaInstanceValidationError < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member lambda {
            Candid::Encounters::V4::Types::MultipleInstancesForSchemaError
          }, key: "MULTIPLE_INSTANCES_FOR_SCHEMA"
          member lambda {
            Candid::Encounters::V4::Types::ValueDoesNotMatchKeyTypeError
          }, key: "VALUE_DOES_NOT_MATCH_KEY_TYPE"
          member -> { Candid::Encounters::V4::Types::KeyDoesNotExistError }, key: "KEY_DOES_NOT_EXIST"
          member -> { Candid::Encounters::V4::Types::SchemaDoesNotExistError }, key: "SCHEMA_DOES_NOT_EXIST"
          member -> { Candid::Encounters::V4::Types::SchemaUnauthorizedAccessError }, key: "SCHEMA_UNAUTHORIZED_ACCESS"
        end
      end
    end
  end
end
