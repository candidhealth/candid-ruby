# frozen_string_literal: true

module Candid
  module PreEncounter
    module Images
      module V1
        module Types
          module ImageStatus
            extend Candid::Internal::Types::Enum
            PENDING = "PENDING"
            UPLOADED = "UPLOADED"
            FAILED = "FAILED"end
        end
      end
    end
  end
end
