# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class GetContractProvidersRequest < Internal::Types::Model
          field :contract_id, -> { String }, optional: false, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
