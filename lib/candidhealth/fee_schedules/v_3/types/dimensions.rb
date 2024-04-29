# frozen_string_literal: true

require_relative "../../../payers/v_3/types/payer_uuid"
require_relative "../../../organization_providers/v_2/types/organization_provider_id"
require "set"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      # Dimension values that qualify a rate. For the optional dimensions, a null value signifies "all apply". For set-type dimensions, an empty set signifies "all apply".
      class Dimensions
        attr_reader :payer_uuid, :organization_billing_provider_id, :states, :zip_codes, :license_types,
                    :facility_type_codes, :network_types, :cpt_code, :modifiers, :additional_properties

        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param organization_billing_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param states [Set<Commons::State>]
        # @param zip_codes [Set<String>]
        # @param license_types [Set<OrganizationProviders::V2::LicenseType>]
        # @param facility_type_codes [Set<Commons::FacilityTypeCode>]
        # @param network_types [Set<Commons::NetworkType>]
        # @param cpt_code [String]
        # @param modifiers [Set<Commons::ProcedureModifier>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::Dimensions]
        def initialize(payer_uuid:, organization_billing_provider_id:, states:, zip_codes:, license_types:,
                       facility_type_codes:, network_types:, cpt_code:, modifiers:, additional_properties: nil)
          # @type [Payers::V3::PAYER_UUID]
          @payer_uuid = payer_uuid
          # @type [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
          @organization_billing_provider_id = organization_billing_provider_id
          # @type [Set<Commons::State>]
          @states = states
          # @type [Set<String>]
          @zip_codes = zip_codes
          # @type [Set<OrganizationProviders::V2::LicenseType>]
          @license_types = license_types
          # @type [Set<Commons::FacilityTypeCode>]
          @facility_type_codes = facility_type_codes
          # @type [Set<Commons::NetworkType>]
          @network_types = network_types
          # @type [String]
          @cpt_code = cpt_code
          # @type [Set<Commons::ProcedureModifier>]
          @modifiers = modifiers
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Dimensions
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::Dimensions]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          payer_uuid = struct.payer_uuid
          organization_billing_provider_id = struct.organization_billing_provider_id
          if parsed_json["states"].nil?
            states = nil
          else
            states = parsed_json["states"].to_json
            states = Set.new(states)
          end
          if parsed_json["zip_codes"].nil?
            zip_codes = nil
          else
            zip_codes = parsed_json["zip_codes"].to_json
            zip_codes = Set.new(zip_codes)
          end
          if parsed_json["license_types"].nil?
            license_types = nil
          else
            license_types = parsed_json["license_types"].to_json
            license_types = Set.new(license_types)
          end
          if parsed_json["facility_type_codes"].nil?
            facility_type_codes = nil
          else
            facility_type_codes = parsed_json["facility_type_codes"].to_json
            facility_type_codes = Set.new(facility_type_codes)
          end
          if parsed_json["network_types"].nil?
            network_types = nil
          else
            network_types = parsed_json["network_types"].to_json
            network_types = Set.new(network_types)
          end
          cpt_code = struct.cpt_code
          if parsed_json["modifiers"].nil?
            modifiers = nil
          else
            modifiers = parsed_json["modifiers"].to_json
            modifiers = Set.new(modifiers)
          end
          new(payer_uuid: payer_uuid, organization_billing_provider_id: organization_billing_provider_id,
              states: states, zip_codes: zip_codes, license_types: license_types, facility_type_codes: facility_type_codes, network_types: network_types, cpt_code: cpt_code, modifiers: modifiers, additional_properties: struct)
        end

        # Serialize an instance of Dimensions to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "payer_uuid": @payer_uuid,
            "organization_billing_provider_id": @organization_billing_provider_id,
            "states": @states,
            "zip_codes": @zip_codes,
            "license_types": @license_types,
            "facility_type_codes": @facility_type_codes,
            "network_types": @network_types,
            "cpt_code": @cpt_code,
            "modifiers": @modifiers
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.payer_uuid.is_a?(UUID) != false || raise("Passed value for field obj.payer_uuid is not the expected type, validation failed.")
          obj.organization_billing_provider_id.is_a?(UUID) != false || raise("Passed value for field obj.organization_billing_provider_id is not the expected type, validation failed.")
          obj.states.is_a?(Set) != false || raise("Passed value for field obj.states is not the expected type, validation failed.")
          obj.zip_codes.is_a?(Set) != false || raise("Passed value for field obj.zip_codes is not the expected type, validation failed.")
          obj.license_types.is_a?(Set) != false || raise("Passed value for field obj.license_types is not the expected type, validation failed.")
          obj.facility_type_codes.is_a?(Set) != false || raise("Passed value for field obj.facility_type_codes is not the expected type, validation failed.")
          obj.network_types.is_a?(Set) != false || raise("Passed value for field obj.network_types is not the expected type, validation failed.")
          obj.cpt_code.is_a?(String) != false || raise("Passed value for field obj.cpt_code is not the expected type, validation failed.")
          obj.modifiers.is_a?(Set) != false || raise("Passed value for field obj.modifiers is not the expected type, validation failed.")
        end
      end
    end
  end
end
