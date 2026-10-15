# frozen_string_literal: true

module Candid
  module Eras
    module Types
      class EraPayment < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :era_document, -> { Candid::Eras::Types::EraDocument }, optional: false, nullable: false
        field :posted_at, -> { String }, optional: false, nullable: false
        field :payer, -> { Candid::Eras::Types::EraPayer }, optional: false, nullable: false
        field :payment_method_code, -> { Candid::EraCommons::Types::PaymentMethodCode }, optional: false, nullable: false
        field :check_eft_trace_number, -> { String }, optional: false, nullable: false
        field :check_issued_or_eft_effective_date, -> { String }, optional: false, nullable: false
        field :total_payment_amount_cents, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
