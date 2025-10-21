# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        module Sex
          extend Candid::Internal::Types::Enum
          FEMALE = "FEMALE"
          MALE = "MALE"
          UNKNOWN = "UNKNOWN"
          REFUSED = "REFUSED"end
      end
    end
  end
end
