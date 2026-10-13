# frozen_string_literal: true

module Candid
  module Eligibility
    module V2
      module Types
        class EligibilityRequest < Internal::Types::Model
          field :member_id, -> { String }, optional: false, nullable: false
          field :dependent_member_id, -> { String }, optional: true, nullable: false
          field :payer_id, -> { String }, optional: false, nullable: false
          field :payer_name, -> { String }, optional: false, nullable: false
          field :provider_npi, -> { String }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false
          field :service_type_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :patient_gender, -> { String }, optional: true, nullable: false
          field :patient_first_name, -> { String }, optional: true, nullable: false
          field :patient_last_name, -> { String }, optional: true, nullable: false
          field :patient_date_of_birth, -> { String }, optional: true, nullable: false
          field :patient_state, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
