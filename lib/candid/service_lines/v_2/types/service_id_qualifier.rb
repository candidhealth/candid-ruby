# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        module ServiceIdQualifier
          extend Candid::Internal::Types::Enum
          EAN_UCC_13 = "EN"
          EAN_UCC_8 = "EO"
          HIBC = "HI"
          NDC_5_4_2_FORMAT = "N4"
          CUSTOMER_ORDER_NUMBER = "ON"
          GTIN = "UK"
          UCC_12 = "UP"end
      end
    end
  end
end
