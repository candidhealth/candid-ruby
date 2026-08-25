# frozen_string_literal: true

module Candid
  module PreEncounter
    module MetadataSchemas
      module V1
        module Types
          # A custom metadata schema with immutable server-owned properties.
          class MetadataSchema < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
