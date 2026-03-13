# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class BenefitsRelatedEntity < Internal::Types::Model
            field :entity_identifier, -> { String }, optional: true, nullable: false, api_name: "entityIdentifier"
            field :entity_type, -> { String }, optional: true, nullable: false, api_name: "entityType"
            field :entity_name, -> { String }, optional: true, nullable: false, api_name: "entityName"
            field :contact_information, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::RelatedEntityContact] }, optional: true, nullable: false, api_name: "contactInformation"
            field :service_type_codes, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::ServiceTypeCode] }, optional: true, nullable: false, api_name: "serviceTypeCodes"
          end
        end
      end
    end
  end
end
