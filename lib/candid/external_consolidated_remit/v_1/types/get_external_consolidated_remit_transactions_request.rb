# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        class GetExternalConsolidatedRemitTransactionsRequest < Internal::Types::Model
          field :consolidated_remit_id, -> { String }, optional: false, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :era_payment_id, -> { String }, optional: true, nullable: false
          field :transaction_id, -> { String }, optional: true, nullable: false
          field :transaction_type, -> { Candid::ExternalConsolidatedRemit::V1::Types::TransactionType }, optional: true, nullable: false
        end
      end
    end
  end
end
