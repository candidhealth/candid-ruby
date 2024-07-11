# frozen_string_literal: true

require_relative "service_facility_status"
require_relative "service_facility_operational_status"
require_relative "service_facility_mode"
require_relative "service_facility_type"
require_relative "service_facility_physical_type"
require_relative "../../../commons/types/street_address_long_zip"
require "ostruct"
require "json"

module CandidApiClient
  module OrganizationServiceFacilities
    module V2
      module Types
        class OrganizationServiceFacilityCreate
          # @return [String] The name of the service facility.
          attr_reader :name
          # @return [Array<String>] A list of alternate names for the service facility.
          attr_reader :aliases
          # @return [String] A description of the service facility.
          attr_reader :description
          # @return [String] An NPI specific to the service facility if applicable, i.e. if it has one and is
          #  not under the billing provider's NPI.
          #  Box 32 section (a) of the CMS-1500 claim form.
          attr_reader :npi
          # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityStatus] The status of the service facility.
          attr_reader :status
          # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityOperationalStatus] The operational status of the service facility.
          attr_reader :operational_status
          # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityMode] The mode of the service facility.
          attr_reader :mode
          # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityType] The type of the service facility.
          attr_reader :type
          # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityPhysicalType] The physical type of the service facility.
          attr_reader :physical_type
          # @return [Array<String>] A list of contact methods for the service facility.
          attr_reader :telecoms
          # @return [CandidApiClient::Commons::Types::StreetAddressLongZip] The address of the service facility.
          attr_reader :address
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param name [String] The name of the service facility.
          # @param aliases [Array<String>] A list of alternate names for the service facility.
          # @param description [String] A description of the service facility.
          # @param npi [String] An NPI specific to the service facility if applicable, i.e. if it has one and is
          #  not under the billing provider's NPI.
          #  Box 32 section (a) of the CMS-1500 claim form.
          # @param status [CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityStatus] The status of the service facility.
          # @param operational_status [CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityOperationalStatus] The operational status of the service facility.
          # @param mode [CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityMode] The mode of the service facility.
          # @param type [CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityType] The type of the service facility.
          # @param physical_type [CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityPhysicalType] The physical type of the service facility.
          # @param telecoms [Array<String>] A list of contact methods for the service facility.
          # @param address [CandidApiClient::Commons::Types::StreetAddressLongZip] The address of the service facility.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityCreate]
          def initialize(name:, aliases:, telecoms:, address:, description: OMIT, npi: OMIT, status: OMIT, operational_status: OMIT,
                         mode: OMIT, type: OMIT, physical_type: OMIT, additional_properties: nil)
            @name = name
            @aliases = aliases
            @description = description if description != OMIT
            @npi = npi if npi != OMIT
            @status = status if status != OMIT
            @operational_status = operational_status if operational_status != OMIT
            @mode = mode if mode != OMIT
            @type = type if type != OMIT
            @physical_type = physical_type if physical_type != OMIT
            @telecoms = telecoms
            @address = address
            @additional_properties = additional_properties
            @_field_set = {
              "name": name,
              "aliases": aliases,
              "description": description,
              "npi": npi,
              "status": status,
              "operational_status": operational_status,
              "mode": mode,
              "type": type,
              "physical_type": physical_type,
              "telecoms": telecoms,
              "address": address
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of OrganizationServiceFacilityCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            name = struct["name"]
            aliases = struct["aliases"]
            description = struct["description"]
            npi = struct["npi"]
            status = struct["status"]
            operational_status = struct["operational_status"]
            mode = struct["mode"]
            type = struct["type"]
            physical_type = struct["physical_type"]
            telecoms = struct["telecoms"]
            if parsed_json["address"].nil?
              address = nil
            else
              address = parsed_json["address"].to_json
              address = CandidApiClient::Commons::Types::StreetAddressLongZip.from_json(json_object: address)
            end
            new(
              name: name,
              aliases: aliases,
              description: description,
              npi: npi,
              status: status,
              operational_status: operational_status,
              mode: mode,
              type: type,
              physical_type: physical_type,
              telecoms: telecoms,
              address: address,
              additional_properties: struct
            )
          end

          # Serialize an instance of OrganizationServiceFacilityCreate to a JSON object
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
            obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.aliases.is_a?(Array) != false || raise("Passed value for field obj.aliases is not the expected type, validation failed.")
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.npi&.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
            obj.status&.is_a?(CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
            obj.operational_status&.is_a?(CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityOperationalStatus) != false || raise("Passed value for field obj.operational_status is not the expected type, validation failed.")
            obj.mode&.is_a?(CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityMode) != false || raise("Passed value for field obj.mode is not the expected type, validation failed.")
            obj.type&.is_a?(CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
            obj.physical_type&.is_a?(CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityPhysicalType) != false || raise("Passed value for field obj.physical_type is not the expected type, validation failed.")
            obj.telecoms.is_a?(Array) != false || raise("Passed value for field obj.telecoms is not the expected type, validation failed.")
            CandidApiClient::Commons::Types::StreetAddressLongZip.validate_raw(obj: obj.address)
          end
        end
      end
    end
  end
end
