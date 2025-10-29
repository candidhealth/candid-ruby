# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class SchemaDoesNotExistError < Internal::Types::Model
          field :schema_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
