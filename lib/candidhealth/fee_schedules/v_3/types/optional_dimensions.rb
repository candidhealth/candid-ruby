# frozen_string_literal: true

require "set"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        # A dimensions object where all properties are optional.
        class OptionalDimensions
          # @return [String]
          attr_reader :payer_uuid
          # @return [String]
          attr_reader :organization_billing_provider_id
          # @return [Set<CandidApiClient::Commons::Types::State>]
          attr_reader :states
          # @return [Set<String>]
          attr_reader :zip_codes
          # @return [Set<CandidApiClient::OrganizationProviders::V2::Types::LicenseType>]
          attr_reader :license_types
          # @return [Set<CandidApiClient::Commons::Types::FacilityTypeCode>]
          attr_reader :facility_type_codes
          # @return [Set<CandidApiClient::Commons::Types::NetworkType>]
          attr_reader :network_types
          # @return [Set<String>]
          attr_reader :payer_plan_group_ids
          # @return [String]
          attr_reader :cpt_code
          # @return [Set<CandidApiClient::Commons::Types::ProcedureModifier>]
          attr_reader :modifiers
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer_uuid [String]
          # @param organization_billing_provider_id [String]
          # @param states [Set<CandidApiClient::Commons::Types::State>]
          # @param zip_codes [Set<String>]
          # @param license_types [Set<CandidApiClient::OrganizationProviders::V2::Types::LicenseType>]
          # @param facility_type_codes [Set<CandidApiClient::Commons::Types::FacilityTypeCode>]
          # @param network_types [Set<CandidApiClient::Commons::Types::NetworkType>]
          # @param payer_plan_group_ids [Set<String>]
          # @param cpt_code [String]
          # @param modifiers [Set<CandidApiClient::Commons::Types::ProcedureModifier>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::OptionalDimensions]
          def initialize(states:, zip_codes:, license_types:, facility_type_codes:, network_types:,
                         payer_plan_group_ids:, modifiers:, payer_uuid: OMIT, organization_billing_provider_id: OMIT, cpt_code: OMIT, additional_properties: nil)
            @payer_uuid = payer_uuid if payer_uuid != OMIT
            if organization_billing_provider_id != OMIT
              @organization_billing_provider_id = organization_billing_provider_id
            end
            @states = states
            @zip_codes = zip_codes
            @license_types = license_types
            @facility_type_codes = facility_type_codes
            @network_types = network_types
            @payer_plan_group_ids = payer_plan_group_ids
            @cpt_code = cpt_code if cpt_code != OMIT
            @modifiers = modifiers
            @additional_properties = additional_properties
            @_field_set = {
              "payer_uuid": payer_uuid,
              "organization_billing_provider_id": organization_billing_provider_id,
              "states": states,
              "zip_codes": zip_codes,
              "license_types": license_types,
              "facility_type_codes": facility_type_codes,
              "network_types": network_types,
              "payer_plan_group_ids": payer_plan_group_ids,
              "cpt_code": cpt_code,
              "modifiers": modifiers
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of OptionalDimensions
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::OptionalDimensions]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            payer_uuid = struct["payer_uuid"]
            organization_billing_provider_id = struct["organization_billing_provider_id"]
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
            if parsed_json["payer_plan_group_ids"].nil?
              payer_plan_group_ids = nil
            else
              payer_plan_group_ids = parsed_json["payer_plan_group_ids"].to_json
              payer_plan_group_ids = Set.new(payer_plan_group_ids)
            end
            cpt_code = struct["cpt_code"]
            if parsed_json["modifiers"].nil?
              modifiers = nil
            else
              modifiers = parsed_json["modifiers"].to_json
              modifiers = Set.new(modifiers)
            end
            new(
              payer_uuid: payer_uuid,
              organization_billing_provider_id: organization_billing_provider_id,
              states: states,
              zip_codes: zip_codes,
              license_types: license_types,
              facility_type_codes: facility_type_codes,
              network_types: network_types,
              payer_plan_group_ids: payer_plan_group_ids,
              cpt_code: cpt_code,
              modifiers: modifiers,
              additional_properties: struct
            )
          end

          # Serialize an instance of OptionalDimensions to a JSON object
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
            obj.payer_uuid&.is_a?(String) != false || raise("Passed value for field obj.payer_uuid is not the expected type, validation failed.")
            obj.organization_billing_provider_id&.is_a?(String) != false || raise("Passed value for field obj.organization_billing_provider_id is not the expected type, validation failed.")
            obj.states.is_a?(Set) != false || raise("Passed value for field obj.states is not the expected type, validation failed.")
            obj.zip_codes.is_a?(Set) != false || raise("Passed value for field obj.zip_codes is not the expected type, validation failed.")
            obj.license_types.is_a?(Set) != false || raise("Passed value for field obj.license_types is not the expected type, validation failed.")
            obj.facility_type_codes.is_a?(Set) != false || raise("Passed value for field obj.facility_type_codes is not the expected type, validation failed.")
            obj.network_types.is_a?(Set) != false || raise("Passed value for field obj.network_types is not the expected type, validation failed.")
            obj.payer_plan_group_ids.is_a?(Set) != false || raise("Passed value for field obj.payer_plan_group_ids is not the expected type, validation failed.")
            obj.cpt_code&.is_a?(String) != false || raise("Passed value for field obj.cpt_code is not the expected type, validation failed.")
            obj.modifiers.is_a?(Set) != false || raise("Passed value for field obj.modifiers is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
