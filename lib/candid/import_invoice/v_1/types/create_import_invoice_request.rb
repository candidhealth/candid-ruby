# frozen_string_literal: true

module Candid
  module ImportInvoice
    module V1
      module Types
        class CreateImportInvoiceRequest < Internal::Types::Model
          field :external_payment_account_config_id, -> { String }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :external_customer_identifier, -> { String }, optional: false, nullable: false
          field :note, -> { String }, optional: true, nullable: false
          field :due_date, -> { String }, optional: true, nullable: false
          field :items, -> { Internal::Types::Array[Candid::Invoices::V2::Types::InvoiceItemCreate] }, optional: false, nullable: false
          field :status, -> { Candid::Invoices::V2::Types::InvoiceStatus }, optional: false, nullable: false
          field :external_identifier, -> { String }, optional: false, nullable: false
          field :customer_invoice_url, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
