# frozen_string_literal: true

module Candid
  module ChargeCaptureBundles
    module V1
      module Types
        class ChargeCaptureClaimCreationPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreation]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
