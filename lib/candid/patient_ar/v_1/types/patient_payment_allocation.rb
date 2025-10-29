# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      module Types
        class PatientPaymentAllocation < Internal::Types::Model
          field :source_id, -> { String }, optional: true, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
