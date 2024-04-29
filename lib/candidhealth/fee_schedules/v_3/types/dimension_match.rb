# frozen_string_literal: true

require_relative "match_payer"
require_relative "match_geo"
require_relative "match_provider"
require_relative "match_date"
require_relative "match_cpt_code"
require_relative "match_modifiers"
require_relative "match_license_type"
require_relative "match_facility_type_code"
require_relative "match_network_types"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      # Dimension matching for a service line
      class DimensionMatch
        attr_reader :payer, :geography, :organization_billing_provider, :date_of_service, :cpt_code, :modifiers,
                    :license_type, :facility_type_code, :network_types, :additional_properties

        # @param payer [FeeSchedules::V3::MatchPayer]
        # @param geography [FeeSchedules::V3::MatchGeo]
        # @param organization_billing_provider [FeeSchedules::V3::MatchProvider]
        # @param date_of_service [FeeSchedules::V3::MatchDate]
        # @param cpt_code [FeeSchedules::V3::MatchCptCode]
        # @param modifiers [FeeSchedules::V3::MatchModifiers]
        # @param license_type [FeeSchedules::V3::MatchLicenseType]
        # @param facility_type_code [FeeSchedules::V3::MatchFacilityTypeCode]
        # @param network_types [FeeSchedules::V3::MatchNetworkTypes]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::DimensionMatch]
        def initialize(payer:, geography:, organization_billing_provider:, date_of_service:, cpt_code:, modifiers:,
                       license_type:, facility_type_code:, network_types:, additional_properties: nil)
          # @type [FeeSchedules::V3::MatchPayer]
          @payer = payer
          # @type [FeeSchedules::V3::MatchGeo]
          @geography = geography
          # @type [FeeSchedules::V3::MatchProvider]
          @organization_billing_provider = organization_billing_provider
          # @type [FeeSchedules::V3::MatchDate]
          @date_of_service = date_of_service
          # @type [FeeSchedules::V3::MatchCptCode]
          @cpt_code = cpt_code
          # @type [FeeSchedules::V3::MatchModifiers]
          @modifiers = modifiers
          # @type [FeeSchedules::V3::MatchLicenseType]
          @license_type = license_type
          # @type [FeeSchedules::V3::MatchFacilityTypeCode]
          @facility_type_code = facility_type_code
          # @type [FeeSchedules::V3::MatchNetworkTypes]
          @network_types = network_types
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of DimensionMatch
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::DimensionMatch]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["payer"].nil?
            payer = nil
          else
            payer = parsed_json["payer"].to_json
            payer = FeeSchedules::V3::MatchPayer.from_json(json_object: payer)
          end
          if parsed_json["geography"].nil?
            geography = nil
          else
            geography = parsed_json["geography"].to_json
            geography = FeeSchedules::V3::MatchGeo.from_json(json_object: geography)
          end
          if parsed_json["organization_billing_provider"].nil?
            organization_billing_provider = nil
          else
            organization_billing_provider = parsed_json["organization_billing_provider"].to_json
            organization_billing_provider = FeeSchedules::V3::MatchProvider.from_json(json_object: organization_billing_provider)
          end
          if parsed_json["date_of_service"].nil?
            date_of_service = nil
          else
            date_of_service = parsed_json["date_of_service"].to_json
            date_of_service = FeeSchedules::V3::MatchDate.from_json(json_object: date_of_service)
          end
          if parsed_json["cpt_code"].nil?
            cpt_code = nil
          else
            cpt_code = parsed_json["cpt_code"].to_json
            cpt_code = FeeSchedules::V3::MatchCptCode.from_json(json_object: cpt_code)
          end
          if parsed_json["modifiers"].nil?
            modifiers = nil
          else
            modifiers = parsed_json["modifiers"].to_json
            modifiers = FeeSchedules::V3::MatchModifiers.from_json(json_object: modifiers)
          end
          if parsed_json["license_type"].nil?
            license_type = nil
          else
            license_type = parsed_json["license_type"].to_json
            license_type = FeeSchedules::V3::MatchLicenseType.from_json(json_object: license_type)
          end
          if parsed_json["facility_type_code"].nil?
            facility_type_code = nil
          else
            facility_type_code = parsed_json["facility_type_code"].to_json
            facility_type_code = FeeSchedules::V3::MatchFacilityTypeCode.from_json(json_object: facility_type_code)
          end
          if parsed_json["network_types"].nil?
            network_types = nil
          else
            network_types = parsed_json["network_types"].to_json
            network_types = FeeSchedules::V3::MatchNetworkTypes.from_json(json_object: network_types)
          end
          new(payer: payer, geography: geography, organization_billing_provider: organization_billing_provider,
              date_of_service: date_of_service, cpt_code: cpt_code, modifiers: modifiers, license_type: license_type, facility_type_code: facility_type_code, network_types: network_types, additional_properties: struct)
        end

        # Serialize an instance of DimensionMatch to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "payer": @payer,
            "geography": @geography,
            "organization_billing_provider": @organization_billing_provider,
            "date_of_service": @date_of_service,
            "cpt_code": @cpt_code,
            "modifiers": @modifiers,
            "license_type": @license_type,
            "facility_type_code": @facility_type_code,
            "network_types": @network_types
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          FeeSchedules::V3::MatchPayer.validate_raw(obj: obj.payer)
          FeeSchedules::V3::MatchGeo.validate_raw(obj: obj.geography)
          FeeSchedules::V3::MatchProvider.validate_raw(obj: obj.organization_billing_provider)
          FeeSchedules::V3::MatchDate.validate_raw(obj: obj.date_of_service)
          FeeSchedules::V3::MatchCptCode.validate_raw(obj: obj.cpt_code)
          FeeSchedules::V3::MatchModifiers.validate_raw(obj: obj.modifiers)
          FeeSchedules::V3::MatchLicenseType.validate_raw(obj: obj.license_type)
          FeeSchedules::V3::MatchFacilityTypeCode.validate_raw(obj: obj.facility_type_code)
          FeeSchedules::V3::MatchNetworkTypes.validate_raw(obj: obj.network_types)
        end
      end
    end
  end
end
