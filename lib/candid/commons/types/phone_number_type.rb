# frozen_string_literal: true

module Candid
  module Commons
    module Types
      module PhoneNumberType
        extend Candid::Internal::Types::Enum

        HOME = "Home"
        MOBILE = "Mobile"
        WORK = "Work"
      end
    end
  end
end
