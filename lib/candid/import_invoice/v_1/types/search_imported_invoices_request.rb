
module Candid
  module ImportInvoice
    module V1
      module Types
        class SearchImportedInvoicesRequest < Internal::Types::Model
          field :patient_external_id, -> { String }, optional: true, nullable: false
          field :encounter_external_id, -> { String }, optional: true, nullable: false
          field :note, -> { String }, optional: true, nullable: false
          field :due_date_before, -> { String }, optional: true, nullable: false
          field :due_date_after, -> { String }, optional: true, nullable: false
          field :status, -> { Candid::Invoices::V2::Types::InvoiceStatus }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :sort, -> { Candid::Invoices::V2::Types::InvoiceSortField }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
