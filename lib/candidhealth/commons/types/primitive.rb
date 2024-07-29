# frozen_string_literal: true

module CandidApiClient
  module Commons
    module Types
      # The BOOLEAN and STRING primitives respectively map to the `boolean` and `string`
      #  JSON data types.
      #  The DOUBLE and INTEGER primitives must be written as a JSON `number` type.
      class Primitive
        BOOLEAN = "BOOLEAN"
        DOUBLE = "DOUBLE"
        INTEGER = "INTEGER"
        STRING = "STRING"
      end
    end
  end
end
