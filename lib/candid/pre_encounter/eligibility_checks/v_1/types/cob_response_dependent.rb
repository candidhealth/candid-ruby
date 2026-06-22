# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Information about the dependent listed in the original COB request.
          class CobResponseDependent < Internal::Types::Model
            field :member_id, -> { String }, optional: true, nullable: false
            field :first_name, -> { String }, optional: true, nullable: false
            field :last_name, -> { String }, optional: true, nullable: false
            field :middle_name, -> { String }, optional: true, nullable: false
            field :gender, -> { String }, optional: true, nullable: false
            field :date_of_birth, -> { String }, optional: true, nullable: false
            field :ssn, -> { String }, optional: true, nullable: false
            field :group_number, -> { String }, optional: true, nullable: false
            field :relation_to_subscriber, -> { String }, optional: true, nullable: false
            field :relation_to_subscriber_code, -> { String }, optional: true, nullable: false
            field :birth_sequence_number, -> { String }, optional: true, nullable: false
            field :address, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CobAddress }, optional: true, nullable: false
            field :aaa_errors, -> { Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
