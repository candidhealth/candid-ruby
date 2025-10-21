# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class SchemaField < Internal::Types::Model
          field :key, -> { String }, optional: false, nullable: false
          field :type, -> { Candid::Commons::Types::Primitive }, optional: false, nullable: false

        end
      end
    end
  end
end
