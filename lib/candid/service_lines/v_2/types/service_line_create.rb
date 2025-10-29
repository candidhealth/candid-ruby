# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class ServiceLineCreate < Internal::Types::Model
          field :diagnosis_pointers, -> { Internal::Types::Array[Integer] }, optional: false, nullable: false
        end
      end
    end
  end
end
