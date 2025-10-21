
module Candid
  module FeeSchedules
    module V3
      module Types
        class HardDeleteRatesByIdsRequest < Internal::Types::Model
          field :rate_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

        end
      end
    end
  end
end
