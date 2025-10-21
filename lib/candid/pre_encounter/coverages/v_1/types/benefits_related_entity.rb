# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class BenefitsRelatedEntity < Internal::Types::Model
            field :entity_identifier, -> { String }, optional: true, nullable: false
            field :entity_type, -> { String }, optional: true, nullable: false
            field :entity_name, -> { String }, optional: true, nullable: false
            field :contact_information, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::RelatedEntityContact] }, optional: true, nullable: false
            field :service_type_codes, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::ServiceTypeCode] }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
