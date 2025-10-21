# frozen_string_literal: true

module Candid
  module WriteOffs
    module V1
      module Types
        class NonInsurancePayerWriteOffCreate < Internal::Types::Model
          field :non_insurance_payer_id, -> { String }, optional: false, nullable: false
          field :service_line_id, -> { String }, optional: false, nullable: false
          field :write_off_timestamp, -> { String }, optional: false, nullable: false
          field :write_off_note, -> { String }, optional: true, nullable: false
          field :write_off_reason, -> { Candid::WriteOffs::V1::Types::InsuranceWriteOffReason }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false

        end
      end
    end
  end
end
