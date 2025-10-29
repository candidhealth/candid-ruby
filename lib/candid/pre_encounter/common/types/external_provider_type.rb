# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        module ExternalProviderType
          extend Candid::Internal::Types::Enum

          PRIMARY = "PRIMARY"
          REFERRING = "REFERRING"
          ATTENDING = "ATTENDING"
        end
      end
    end
  end
end
