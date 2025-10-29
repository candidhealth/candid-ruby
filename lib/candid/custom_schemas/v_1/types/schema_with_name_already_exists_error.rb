# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class SchemaWithNameAlreadyExistsError < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
