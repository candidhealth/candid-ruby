# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          # A set of custom key/value pairs validated against a single MetadataSchema.
          class CustomMetadataEntry < Internal::Types::Model
            field :metadata_schema_id, -> { String }, optional: false, nullable: false
            field :key_value_pairs, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
