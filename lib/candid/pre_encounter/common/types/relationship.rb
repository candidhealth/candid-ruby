# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        module Relationship
          extend Candid::Internal::Types::Enum
          SELF = "SELF"
          SPOUSE = "SPOUSE"
          CHILD = "CHILD"
          COMMON_LAW_SPOUSE = "COMMON_LAW_SPOUSE"
          OTHER = "OTHER"end
      end
    end
  end
end
