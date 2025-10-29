# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class SchemaInstanceOptional < Internal::Types::Model
          field :schema_id, -> { String }, optional: true, nullable: false
          field :content, lambda {
            Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
