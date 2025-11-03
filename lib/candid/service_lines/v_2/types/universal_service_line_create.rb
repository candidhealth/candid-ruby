# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class UniversalServiceLineCreate < Internal::Types::Model
          field :diagnosis_pointers, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false
          field :revenue_code, -> { String }, optional: true, nullable: false
          field :procedure_code, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
