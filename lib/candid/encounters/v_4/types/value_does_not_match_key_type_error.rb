# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class ValueDoesNotMatchKeyTypeError < Internal::Types::Model
          field :schema_id, -> { String }, optional: false, nullable: false
          field :key, -> { String }, optional: false, nullable: false
          field :expected_value_type, -> { Candid::Commons::Types::Primitive }, optional: false, nullable: false
          field :value, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

        end
      end
    end
  end
end
