# frozen_string_literal: true

module Candid
  module PreEncounter
    module MetadataSchemas
      module V1
        module Types
          # A single typed field within a custom metadata schema.
          class MetadataField < Internal::Types::Model
            field :key, -> { String }, optional: false, nullable: false
            field :type, -> { Candid::PreEncounter::MetadataSchemas::V1::Types::MetadataFieldType }, optional: false, nullable: false
            field :enum_values, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
