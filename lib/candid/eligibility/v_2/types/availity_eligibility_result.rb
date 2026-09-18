# frozen_string_literal: true

module Candid
  module Eligibility
    module V2
      module Types
        class AvailityEligibilityResult < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false, api_name: "dateOfService"
          field :payer_id, -> { String }, optional: false, nullable: false, api_name: "payerId"
          field :provider_npi, -> { String }, optional: false, nullable: false, api_name: "providerNPI"
          field :dependent, -> { String }, optional: true, nullable: false
          field :status, -> { Candid::Eligibility::V2::Types::EligibilityStatus }, optional: false, nullable: false
        end
      end
    end
  end
end
