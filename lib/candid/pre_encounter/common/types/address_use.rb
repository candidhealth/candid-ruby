# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        module AddressUse
          extend Candid::Internal::Types::Enum

          HOME = "HOME"
          WORK = "WORK"
          TEMP = "TEMP"
          OLD = "OLD"
          BILLING = "BILLING"
        end
      end
    end
  end
end
