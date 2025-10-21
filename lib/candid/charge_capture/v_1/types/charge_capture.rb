# frozen_string_literal: true

module Candid
  module ChargeCapture
    module V1
      module Types
        class ChargeCapture < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :status, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureStatus }, optional: false, nullable: false
          field :charge_capture_data, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureData }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :charge_external_id, -> { String }, optional: false, nullable: false
          field :ehr_source_url, -> { String }, optional: true, nullable: false
          field :originating_system, -> { String }, optional: true, nullable: false
          field :claim_creation_category, -> { String }, optional: true, nullable: false
          field :error, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureError }, optional: true, nullable: false
          field :updates, -> { Internal::Types::Array[Candid::ChargeCapture::V1::Types::ChargeCapturePostBilledChange] }, optional: false, nullable: false
          field :claim_creation_id, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
