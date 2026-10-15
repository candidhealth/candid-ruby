# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        # No total_count is returned for this endpoint. prev_page_token/next_page_token are only null
        # when there is genuinely no more data in that direction.
        class ExternalConsolidatedRemitTransactionPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::ExternalConsolidatedRemit::V1::Types::ExternalConsolidatedRemitTransaction] }, optional: false, nullable: false
        end
      end
    end
  end
end
