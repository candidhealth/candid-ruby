# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class ServiceLineEraData < Internal::Types::Model
          field :service_line_adjustments, -> { Internal::Types::Array[Candid::ServiceLines::V2::Types::ServiceLineAdjustment] }, optional: false, nullable: false
          field :remittance_advice_remark_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false

        end
      end
    end
  end
end
