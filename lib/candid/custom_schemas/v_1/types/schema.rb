# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class Schema < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :name, -> { String }, optional: false, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :fields, lambda {
            Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaField]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
