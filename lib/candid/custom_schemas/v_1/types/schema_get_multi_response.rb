# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class SchemaGetMultiResponse < Internal::Types::Model
          field :schemas, -> { Internal::Types::Array[Candid::CustomSchemas::V1::Types::Schema] }, optional: false, nullable: false

        end
      end
    end
  end
end
