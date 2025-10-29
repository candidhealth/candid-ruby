# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class SchemaInstance < Internal::Types::Model
          field :schema_id, -> { String }, optional: false, nullable: false
          field :content, lambda {
            Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
