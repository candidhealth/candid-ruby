# frozen_string_literal: true

require_relative "organization_service_facility_id"
require_relative "service_facility_status"
require_relative "service_facility_operational_status"
require_relative "service_facility_mode"
require_relative "service_facility_type"
require_relative "service_facility_physical_type"
require_relative "../../../commons/types/street_address_long_zip"
require "json"

module CandidApiClient
  module OrganizationServiceFacilities
    module V2
      class OrganizationServiceFacility
        attr_reader :organization_service_facility_id, :name, :aliases, :description, :npi, :status,
                    :operational_status, :mode, :type, :physical_type, :telecoms, :address, :additional_properties

        # @param organization_service_facility_id [OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID]
        # @param name [String] The name of the service facility.
        # @param aliases [Array<String>] A list of alternate names for the service facility.
        # @param description [String] A description of the service facility.
        # @param npi [String] An NPI specific to the service facility if applicable, i.e. if it has one and is not under the billing provider's NPI.
        #   Box 32 section (a) of the CMS-1500 claim form.
        # @param status [OrganizationServiceFacilities::V2::ServiceFacilityStatus] The status of the service facility.
        # @param operational_status [OrganizationServiceFacilities::V2::ServiceFacilityOperationalStatus] The operational status of the service facility.
        # @param mode [OrganizationServiceFacilities::V2::ServiceFacilityMode] The mode of the service facility.
        # @param type [OrganizationServiceFacilities::V2::ServiceFacilityType] The type of the service facility.
        # @param physical_type [OrganizationServiceFacilities::V2::ServiceFacilityPhysicalType] The physical type of the service facility.
        # @param telecoms [Array<String>] A list of contact methods for the service facility.
        # @param address [Commons::StreetAddressLongZip] The address of the service facility.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [OrganizationServiceFacilities::V2::OrganizationServiceFacility]
        def initialize(organization_service_facility_id:, name:, aliases:, telecoms:, address:, description: nil, npi: nil, status: nil,
                       operational_status: nil, mode: nil, type: nil, physical_type: nil, additional_properties: nil)
          # @type [OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID]
          @organization_service_facility_id = organization_service_facility_id
          # @type [String] The name of the service facility.
          @name = name
          # @type [Array<String>] A list of alternate names for the service facility.
          @aliases = aliases
          # @type [String] A description of the service facility.
          @description = description
          # @type [String] An NPI specific to the service facility if applicable, i.e. if it has one and is not under the billing provider's NPI.
          #   Box 32 section (a) of the CMS-1500 claim form.
          @npi = npi
          # @type [OrganizationServiceFacilities::V2::ServiceFacilityStatus] The status of the service facility.
          @status = status
          # @type [OrganizationServiceFacilities::V2::ServiceFacilityOperationalStatus] The operational status of the service facility.
          @operational_status = operational_status
          # @type [OrganizationServiceFacilities::V2::ServiceFacilityMode] The mode of the service facility.
          @mode = mode
          # @type [OrganizationServiceFacilities::V2::ServiceFacilityType] The type of the service facility.
          @type = type
          # @type [OrganizationServiceFacilities::V2::ServiceFacilityPhysicalType] The physical type of the service facility.
          @physical_type = physical_type
          # @type [Array<String>] A list of contact methods for the service facility.
          @telecoms = telecoms
          # @type [Commons::StreetAddressLongZip] The address of the service facility.
          @address = address
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of OrganizationServiceFacility
        #
        # @param json_object [JSON]
        # @return [OrganizationServiceFacilities::V2::OrganizationServiceFacility]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          organization_service_facility_id = struct.organization_service_facility_id
          name = struct.name
          aliases = struct.aliases
          description = struct.description
          npi = struct.npi
          status = struct.status
          operational_status = struct.operational_status
          mode = struct.mode
          type = struct.type
          physical_type = struct.physical_type
          telecoms = struct.telecoms
          if parsed_json["address"].nil?
            address = nil
          else
            address = parsed_json["address"].to_json
            address = Commons::StreetAddressLongZip.from_json(json_object: address)
          end
          new(organization_service_facility_id: organization_service_facility_id, name: name, aliases: aliases,
              description: description, npi: npi, status: status, operational_status: operational_status, mode: mode, type: type, physical_type: physical_type, telecoms: telecoms, address: address, additional_properties: struct)
        end

        # Serialize an instance of OrganizationServiceFacility to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "organization_service_facility_id": @organization_service_facility_id,
            "name": @name,
            "aliases": @aliases,
            "description": @description,
            "npi": @npi,
            "status": @status,
            "operational_status": @operational_status,
            "mode": @mode,
            "type": @type,
            "physical_type": @physical_type,
            "telecoms": @telecoms,
            "address": @address
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.organization_service_facility_id.is_a?(UUID) != false || raise("Passed value for field obj.organization_service_facility_id is not the expected type, validation failed.")
          obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
          obj.aliases.is_a?(Array) != false || raise("Passed value for field obj.aliases is not the expected type, validation failed.")
          obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
          obj.npi&.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
          obj.status&.is_a?(OrganizationServiceFacilities::V2::ServiceFacilityStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.operational_status&.is_a?(OrganizationServiceFacilities::V2::ServiceFacilityOperationalStatus) != false || raise("Passed value for field obj.operational_status is not the expected type, validation failed.")
          obj.mode&.is_a?(OrganizationServiceFacilities::V2::ServiceFacilityMode) != false || raise("Passed value for field obj.mode is not the expected type, validation failed.")
          obj.type&.is_a?(OrganizationServiceFacilities::V2::ServiceFacilityType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
          obj.physical_type&.is_a?(OrganizationServiceFacilities::V2::ServiceFacilityPhysicalType) != false || raise("Passed value for field obj.physical_type is not the expected type, validation failed.")
          obj.telecoms.is_a?(Array) != false || raise("Passed value for field obj.telecoms is not the expected type, validation failed.")
          Commons::StreetAddressLongZip.validate_raw(obj: obj.address)
        end
      end
    end
  end
end
