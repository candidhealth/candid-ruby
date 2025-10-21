# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        module LineOfBusiness
          extend Candid::Internal::Types::Enum
          MEDICARE = "medicare"
          MEDICAID = "medicaid"
          COMMERCIAL = "commercial"end
      end
    end
  end
end
