# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing the data for an eligibility request.
          class EligibilityRequest < Internal::Types::Model
            field :submitter_transaction_identifier, -> { String }, optional: true, nullable: false
            field :payer_id, -> { String }, optional: false, nullable: false
            field :provider, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::Provider
            }, optional: false, nullable: false
            field :subscriber, lambda {
              Candid::PreEncounter::Coverages::V1::Types::MemberInfo
            }, optional: false, nullable: false
            field :dependent, lambda {
              Candid::PreEncounter::Coverages::V1::Types::MemberInfo
            }, optional: true, nullable: false
            field :encounter, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::Encounter
            }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
