# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        # posted_by and voided_by are always null for this transaction type - there is no way to
        # determine who posted or voided an insurance payment after the fact. remit_id,
        # consolidated_remit_id, and era_payer_name are effectively always non-null for this type
        # (typed nullable here only for consistency with the shared TransactionCommonFields shape).
        class ExternalConsolidatedRemitInsurancePaymentTransaction < Internal::Types::Model
          field :provider_adjustment_reason_code, -> { String }, optional: true, nullable: false
          field :voids_transaction_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
