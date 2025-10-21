
module Candid
  module Contracts
    module V2
      module Types
        class GetMultiContractsRequest < Internal::Types::Model
          field :page_token, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :contracting_provider_id, -> { String }, optional: true, nullable: false
          field :rendering_provider_ids, -> { String }, optional: true, nullable: false
          field :payer_names, -> { String }, optional: true, nullable: false
          field :states, -> { Candid::Commons::Types::State }, optional: true, nullable: false
          field :contract_status, -> { Candid::Contracts::V2::Types::ContractStatus }, optional: true, nullable: false
          field :sort, -> { Candid::Contracts::V2::Types::ContractSortField }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false

        end
      end
    end
  end
end
