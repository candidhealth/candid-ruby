# frozen_string_literal: true

module Candid
  module X12
    module V1
      module Types
        # A type of bill can either be seen as a compositio of structured parts, or as a literal string.
        # This union represents the potential to express a type of bill either as one of those two shapes.
        # Passing a string, this update will be seen as a complete 4 digit code, along with a padding code 0, that
        # should match a valid composition.
        # Passing as a structure, the update will be seen as three parts and will be joined together by the server
        # to represent a valid composition for you.
        # Which you use depends upon whether you are "passing through" coded information or making a decision about its
        # structure explicitly.
        class TypeOfBillCompositeUpdate < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { String }, key: "RAW_CODE"
          member -> { Candid::X12::V1::Types::TypeOfBillCompositeBase }, key: "COMPOSITE_CODES"
        end
      end
    end
  end
end
