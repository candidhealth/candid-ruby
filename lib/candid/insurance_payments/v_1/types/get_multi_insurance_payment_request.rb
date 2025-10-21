
module Candid
  module InsurancePayments
    module V1
      module Types
        class GetMultiInsurancePaymentRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :payer_uuid, -> { String }, optional: true, nullable: false
          field :claim_id, -> { String }, optional: true, nullable: false
          field :service_line_id, -> { String }, optional: true, nullable: false
          field :billing_provider_id, -> { String }, optional: true, nullable: false
          field :sort, -> { Candid::InsurancePayments::V1::Types::InsurancePaymentSortField }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
