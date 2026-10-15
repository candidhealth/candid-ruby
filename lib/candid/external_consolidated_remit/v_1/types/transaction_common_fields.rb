# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        # Fields present on every transaction, regardless of type. See each concrete transaction
        # schema's description for the one place nullability genuinely differs by type
        # (remit_id/consolidated_remit_id/era_payer_name).
        class TransactionCommonFields < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :remit_id, -> { String }, optional: true, nullable: false
          field :consolidated_remit_id, -> { String }, optional: true, nullable: false
          field :era_payer_name, -> { String }, optional: true, nullable: false
          field :target_type, -> { Candid::ExternalConsolidatedRemit::V1::Types::TargetType }, optional: false, nullable: false
          field :target_id, -> { String }, optional: false, nullable: false
          field :organization_service_facility_id, -> { String }, optional: true, nullable: false
          field :organization_service_facility_external_id, -> { String }, optional: true, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :is_void, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :posted_at, -> { String }, optional: true, nullable: false
          field :posted_by, -> { String }, optional: true, nullable: false
          field :voided_at, -> { String }, optional: true, nullable: false
          field :voided_by, -> { String }, optional: true, nullable: false
          field :source, -> { Candid::ExternalConsolidatedRemit::V1::Types::TransactionSource }, optional: false, nullable: false
        end
      end
    end
  end
end
