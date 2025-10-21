# frozen_string_literal: true

module Candid
  module WriteOffs
    module V1
      module Types
        class PatientWriteOff < Internal::Types::Model
          field :write_off_id, -> { String }, optional: false, nullable: false
          field :write_off_timestamp, -> { String }, optional: false, nullable: false
          field :write_off_note, -> { String }, optional: true, nullable: false
          field :write_off_reason, -> { Candid::WriteOffs::V1::Types::PatientWriteOffReason }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :claim_id, -> { String }, optional: false, nullable: false
          field :service_line_id, -> { String }, optional: false, nullable: false
          field :reverts_write_off_id, -> { String }, optional: true, nullable: false
          field :reverted_by_write_off_id, -> { String }, optional: true, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false

        end
      end
    end
  end
end
