# frozen_string_literal: true

module Candid
  module Dashboarding
    module V1
      module Types
        module MetricSnapshot
          extend Candid::Internal::Types::Enum

          TODAY = "today"
          YESTERDAY = "yesterday"
        end
      end
    end
  end
end
