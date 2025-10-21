# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class KeyWithNameAlreadyExistsError < Internal::Types::Model
          field :key, -> { String }, optional: false, nullable: false
          field :value_type, -> { Candid::Commons::Types::Primitive }, optional: false, nullable: false

        end
      end
    end
  end
end
