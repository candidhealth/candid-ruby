
module Candid
  module ChargeCapture
    module V1
      module Types
        class ChargeCaptureUpdate < Internal::Types::Model
          field :charge_capture_id, -> { String }, optional: false, nullable: false
          field :data, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureData }, optional: true, nullable: false
          field :charge_external_id, -> { String }, optional: true, nullable: false
          field :ehr_source_url, -> { String }, optional: true, nullable: false
          field :originating_system, -> { String }, optional: true, nullable: false
          field :claim_creation_category, -> { String }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: true, nullable: false
          field :status, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureStatus }, optional: true, nullable: false

        end
      end
    end
  end
end
