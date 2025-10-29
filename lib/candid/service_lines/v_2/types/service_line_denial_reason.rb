# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        # The reason a given service line was denied within a given time range.
        # A service line may be denied for different reasons over time, but only one reason at a time.
        class ServiceLineDenialReason < Internal::Types::Model
          field :reason, -> { Candid::ServiceLines::V2::Types::DenialReasonContent }, optional: true, nullable: false
        end
      end
    end
  end
end
