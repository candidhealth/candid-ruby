# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V1
      module Types
        class ExpectedNetworkStatusRequest < Internal::Types::Model
          field :external_patient_id, -> { String }, optional: true, nullable: false
          field :subscriber_payer_id, -> { String }, optional: false, nullable: false
          field :subscriber_payer_name, -> { String }, optional: false, nullable: false
          field :subscriber_insurance_type, lambda {
            Candid::Commons::Types::InsuranceTypeCode
          }, optional: true, nullable: false
          field :subscriber_plan_name, -> { String }, optional: true, nullable: false
          field :billing_provider_npi, -> { String }, optional: false, nullable: false
          field :billing_provider_tin, -> { String }, optional: false, nullable: false
          field :rendering_provider_npi, -> { String }, optional: false, nullable: false
          field :contracted_state, -> { Candid::Commons::Types::State }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
