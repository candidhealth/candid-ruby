
module Candid
  module InsuranceRefunds
    module V1
      module Types
        class GetMultiInsuranceRefundsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :payer_uuid, -> { String }, optional: true, nullable: false
          field :claim_id, -> { String }, optional: true, nullable: false
          field :service_line_id, -> { String }, optional: true, nullable: false
          field :billing_provider_id, -> { String }, optional: true, nullable: false
          field :sort, -> { Candid::InsuranceRefunds::V1::Types::InsuranceRefundSortField }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
