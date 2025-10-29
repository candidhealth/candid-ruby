# frozen_string_literal: true

module Candid
  module ExternalPaymentAccountConfig
    module V1
      module Types
        class GetExternalPaymentAccountConfigsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
