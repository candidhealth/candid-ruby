# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class Authorization < Internal::Types::Model
            field :payer_id, -> { String }, optional: false, nullable: false
            field :payer_name, -> { String }, optional: false, nullable: false
            field :additional_payer_information, -> { Candid::PreEncounter::Common::Types::AdditionalPayerInformation }, optional: true, nullable: false
            field :authorization_number, -> { String }, optional: false, nullable: false
            field :cpt_code, -> { String }, optional: false, nullable: false
            field :apply_for_all_cpt_codes, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :no_prior_authorization_required, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :units, -> { Candid::PreEncounter::Patients::V1::Types::AuthorizationUnit }, optional: false, nullable: false
            field :quantity, -> { Integer }, optional: true, nullable: false
            field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false
            field :notes, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
