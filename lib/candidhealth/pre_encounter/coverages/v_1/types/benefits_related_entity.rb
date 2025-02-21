# frozen_string_literal: true

require_relative "related_entity_contact"
require_relative "service_type_code"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class BenefitsRelatedEntity
            # @return [String]
            attr_reader :entity_identifier
            # @return [String]
            attr_reader :entity_type
            # @return [String]
            attr_reader :entity_name
            # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::RelatedEntityContact>]
            attr_reader :contact_information
            # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceTypeCode>]
            attr_reader :service_type_codes
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param entity_identifier [String]
            # @param entity_type [String]
            # @param entity_name [String]
            # @param contact_information [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::RelatedEntityContact>]
            # @param service_type_codes [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceTypeCode>]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::BenefitsRelatedEntity]
            def initialize(entity_identifier: OMIT, entity_type: OMIT, entity_name: OMIT, contact_information: OMIT,
                           service_type_codes: OMIT, additional_properties: nil)
              @entity_identifier = entity_identifier if entity_identifier != OMIT
              @entity_type = entity_type if entity_type != OMIT
              @entity_name = entity_name if entity_name != OMIT
              @contact_information = contact_information if contact_information != OMIT
              @service_type_codes = service_type_codes if service_type_codes != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "entityIdentifier": entity_identifier,
                "entityType": entity_type,
                "entityName": entity_name,
                "contactInformation": contact_information,
                "serviceTypeCodes": service_type_codes
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of BenefitsRelatedEntity
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::BenefitsRelatedEntity]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              entity_identifier = struct["entityIdentifier"]
              entity_type = struct["entityType"]
              entity_name = struct["entityName"]
              contact_information = parsed_json["contactInformation"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Coverages::V1::Types::RelatedEntityContact.from_json(json_object: item)
              end
              service_type_codes = struct["serviceTypeCodes"]
              new(
                entity_identifier: entity_identifier,
                entity_type: entity_type,
                entity_name: entity_name,
                contact_information: contact_information,
                service_type_codes: service_type_codes,
                additional_properties: struct
              )
            end

            # Serialize an instance of BenefitsRelatedEntity to a JSON object
            #
            # @return [String]
            def to_json(*_args)
              @_field_set&.to_json
            end

            # Leveraged for Union-type generation, validate_raw attempts to parse the given
            #  hash and check each fields type against the current object's property
            #  definitions.
            #
            # @param obj [Object]
            # @return [Void]
            def self.validate_raw(obj:)
              obj.entity_identifier&.is_a?(String) != false || raise("Passed value for field obj.entity_identifier is not the expected type, validation failed.")
              obj.entity_type&.is_a?(String) != false || raise("Passed value for field obj.entity_type is not the expected type, validation failed.")
              obj.entity_name&.is_a?(String) != false || raise("Passed value for field obj.entity_name is not the expected type, validation failed.")
              obj.contact_information&.is_a?(Array) != false || raise("Passed value for field obj.contact_information is not the expected type, validation failed.")
              obj.service_type_codes&.is_a?(Array) != false || raise("Passed value for field obj.service_type_codes is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
