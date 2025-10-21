
module Candid
  module WriteOffs
    module V1
      module Types
        class GetMultiWriteOffsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: true, nullable: false
          field :payer_uuid, -> { String }, optional: true, nullable: false
          field :service_line_id, -> { String }, optional: true, nullable: false
          field :claim_id, -> { String }, optional: true, nullable: false
          field :billing_provider_id, -> { String }, optional: true, nullable: false
          field :sort, -> { Candid::WriteOffs::V1::Types::WriteOffSortField }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :account_types, -> { Candid::Financials::Types::AccountType }, optional: true, nullable: false

        end
      end
    end
  end
end
