# frozen_string_literal: true

module Candid
  module PreEncounter
    module MetadataSchemas
      module V1
        module Types
          # An object representing a custom metadata schema.
          class MutableMetadataSchema < Internal::Types::Model
            field :name, -> { String }, optional: false, nullable: false
            field :description, -> { String }, optional: true, nullable: false
            field :fields, -> { Internal::Types::Array[Candid::PreEncounter::MetadataSchemas::V1::Types::MetadataField] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
