# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        module SexualOrientation
          extend Candid::Internal::Types::Enum

          HETEROSEXUAL = "HETEROSEXUAL"
          HOMOSEXUAL = "HOMOSEXUAL"
          BISEXUAL = "BISEXUAL"
          TWO_SPIRIT = "TWO_SPIRIT"
          OTHER = "OTHER"
          UNKNOWN = "UNKNOWN"
          REFUSED = "REFUSED"
        end
      end
    end
  end
end
