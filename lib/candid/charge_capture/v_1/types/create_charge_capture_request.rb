# frozen_string_literal: true

module Candid
  module ChargeCapture
    module V1
      module Types
        class CreateChargeCaptureRequest < Internal::Types::Model
          field :data, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureData }, optional: false, nullable: false
          field :charge_external_id, -> { String }, optional: false, nullable: false
          field :originating_system, -> { String }, optional: true, nullable: false
          field :claim_creation_category, -> { String }, optional: true, nullable: false
          field :ehr_source_url, -> { String }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :status, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureStatus }, optional: false, nullable: false
          field :attachment_external_document_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :metadata, -> { Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaInstance] }, optional: true, nullable: false
        end
      end
    end
  end
end
