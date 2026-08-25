# frozen_string_literal: true

module Candid
  module PreEncounter
    module MetadataSchemas
      module V1
        module Types
          class MetadataSchemaPage < Internal::Types::Model
            field :items, -> { Internal::Types::Array[Candid::PreEncounter::MetadataSchemas::V1::Types::MetadataSchema] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
