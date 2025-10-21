# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        class ExpectedNetworkStatusSubscriberInformation < Internal::Types::Model
          field :payer_uuid, -> { String }, optional: false, nullable: false
          field :member_id, -> { String }, optional: false, nullable: false
          field :insurance_type, -> { Candid::ExpectedNetworkStatus::V2::Types::InsuranceType }, optional: false, nullable: false

        end
      end
    end
  end
end
