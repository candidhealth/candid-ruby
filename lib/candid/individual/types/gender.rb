# frozen_string_literal: true

module Candid
  module Individual
    module Types
      module Gender
        extend Candid::Internal::Types::Enum

        MALE = "male"
        FEMALE = "female"
        OTHER = "other"
        NOT_GIVEN = "not_given"
        UNKNOWN = "unknown"
      end
    end
  end
end
