# frozen_string_literal: true

module Candid
  module Internal
    module Types
      module Unknown
        include Candid::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
