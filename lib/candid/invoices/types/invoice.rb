# frozen_string_literal: true

module Candid
  module Invoices
    module Types
      class Invoice < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :created_at, -> { String }, optional: false, nullable: false
        field :updated_at, -> { String }, optional: false, nullable: false
        field :organzation_id, -> { String }, optional: false, nullable: false
        field :source_id, -> { String }, optional: false, nullable: false
        field :source_customer_id, -> { String }, optional: false, nullable: false
        field :patient_external_id, -> { String }, optional: false, nullable: false
        field :note, -> { String }, optional: true, nullable: false
        field :due_date, -> { String }, optional: false, nullable: false
        field :status, -> { Candid::Invoices::Types::InvoiceStatus }, optional: false, nullable: false
        field :url, -> { String }, optional: true, nullable: false
        field :customer_invoice_url, -> { String }, optional: true, nullable: false
        field :items, lambda {
          Internal::Types::Array[Candid::Invoices::Types::InvoiceItem]
        }, optional: false, nullable: false
      end
    end
  end
end
