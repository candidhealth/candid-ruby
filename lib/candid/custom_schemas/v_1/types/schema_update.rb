# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class SchemaUpdate < Internal::Types::Model
          field :schema_id, -> { String }, optional: false, nullable: false
          field :name, -> { String }, optional: true, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :fields_to_add, lambda {
            Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaField]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
