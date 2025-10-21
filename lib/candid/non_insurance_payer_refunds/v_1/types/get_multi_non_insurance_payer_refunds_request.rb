
module Candid
  module NonInsurancePayerRefunds
    module V1
      module Types
        class GetMultiNonInsurancePayerRefundsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :non_insurance_payer_id, -> { String }, optional: true, nullable: false
          field :check_number, -> { String }, optional: true, nullable: false
          field :invoice_id, -> { String }, optional: true, nullable: false
          field :sort, -> { Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundSortField }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
