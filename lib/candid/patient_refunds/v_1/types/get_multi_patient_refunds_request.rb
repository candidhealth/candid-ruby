# frozen_string_literal: true

module Candid
  module PatientRefunds
    module V1
      module Types
        class GetMultiPatientRefundsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: true, nullable: false
          field :claim_id, -> { String }, optional: true, nullable: false
          field :service_line_id, -> { String }, optional: true, nullable: false
          field :billing_provider_id, -> { String }, optional: true, nullable: false
          field :unattributed, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :invoice_id, -> { String }, optional: true, nullable: false
          field :sources, -> { Candid::Financials::Types::PatientTransactionSource }, optional: true, nullable: false
          field :sort, -> { Candid::PatientRefunds::V1::Types::PatientRefundSortField }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
