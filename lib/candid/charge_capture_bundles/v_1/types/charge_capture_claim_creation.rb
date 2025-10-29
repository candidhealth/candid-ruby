# frozen_string_literal: true

module Candid
  module ChargeCaptureBundles
    module V1
      module Types
        class ChargeCaptureClaimCreation < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :created_encounter_id, -> { String }, optional: true, nullable: false
          field :status, lambda {
            Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationStatus
          }, optional: false, nullable: false
          field :characteristics, lambda {
            Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
          }, optional: false, nullable: false
          field :errors, lambda {
            Internal::Types::Array[Candid::ChargeCapture::V1::Types::ChargeCaptureError]
          }, optional: false, nullable: false
          field :encounter_creation_input, lambda {
            Candid::ChargeCapture::V1::Types::ChargeCaptureData
          }, optional: true, nullable: false
        end
      end
    end
  end
end
