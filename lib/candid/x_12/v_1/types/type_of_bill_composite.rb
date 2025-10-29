# frozen_string_literal: true

module Candid
  module X12
    module V1
      module Types
        class TypeOfBillComposite < Internal::Types::Model
          field :code, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
