# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class StediPayer < Internal::Types::Model
            field :stedi_id, -> { String }, optional: false, nullable: false
            field :display_name, -> { String }, optional: false, nullable: false
            field :primary_payer_id, -> { String }, optional: false, nullable: false
            field :aliases, -> { Internal::Types::Array[String] }, optional: false, nullable: false
            field :names, -> { Internal::Types::Array[String] }, optional: false, nullable: false
            field :transaction_support, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
            field :employer_identification_numbers, -> { Internal::Types::Array[String] }, optional: true, nullable: false
            field :payer_enrollment, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
            field :parent_payer_group, -> { String }, optional: true, nullable: false
            field :coverage_types, -> { Internal::Types::Array[String] }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
