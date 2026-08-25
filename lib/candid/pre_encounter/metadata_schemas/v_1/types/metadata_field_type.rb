# frozen_string_literal: true

module Candid
  module PreEncounter
    module MetadataSchemas
      module V1
        module Types
          module MetadataFieldType
            extend Candid::Internal::Types::Enum

            STRING = "STRING"
            INTEGER = "INTEGER"
            DOUBLE = "DOUBLE"
            BOOLEAN = "BOOLEAN"
            ENUM = "ENUM"
          end
        end
      end
    end
  end
end
