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
require_relative "match_payer_plan_groups"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        # Dimension matching for a service line
        class DimensionMatch
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchPayer]
          attr_reader :payer
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchGeo]
          attr_reader :geography
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchProvider]
          attr_reader :organization_billing_provider
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchDate]
          attr_reader :date_of_service
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchCptCode]
          attr_reader :cpt_code
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchModifiers]
          attr_reader :modifiers
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchLicenseType]
          attr_reader :license_type
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchFacilityTypeCode]
          attr_reader :facility_type_code
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchNetworkTypes]
          attr_reader :network_types
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchPayerPlanGroups]
          attr_reader :payer_plan_groups
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer [CandidApiClient::FeeSchedules::V3::Types::MatchPayer]
          # @param geography [CandidApiClient::FeeSchedules::V3::Types::MatchGeo]
          # @param organization_billing_provider [CandidApiClient::FeeSchedules::V3::Types::MatchProvider]
          # @param date_of_service [CandidApiClient::FeeSchedules::V3::Types::MatchDate]
          # @param cpt_code [CandidApiClient::FeeSchedules::V3::Types::MatchCptCode]
          # @param modifiers [CandidApiClient::FeeSchedules::V3::Types::MatchModifiers]
          # @param license_type [CandidApiClient::FeeSchedules::V3::Types::MatchLicenseType]
          # @param facility_type_code [CandidApiClient::FeeSchedules::V3::Types::MatchFacilityTypeCode]
          # @param network_types [CandidApiClient::FeeSchedules::V3::Types::MatchNetworkTypes]
          # @param payer_plan_groups [CandidApiClient::FeeSchedules::V3::Types::MatchPayerPlanGroups]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::DimensionMatch]
          def initialize(payer:, geography:, organization_billing_provider:, date_of_service:, cpt_code:, modifiers:,
                         license_type:, facility_type_code:, network_types:, payer_plan_groups:, additional_properties: nil)
            @payer = payer
            @geography = geography
            @organization_billing_provider = organization_billing_provider
            @date_of_service = date_of_service
            @cpt_code = cpt_code
            @modifiers = modifiers
            @license_type = license_type
            @facility_type_code = facility_type_code
            @network_types = network_types
            @payer_plan_groups = payer_plan_groups
            @additional_properties = additional_properties
            @_field_set = {
              "payer": payer,
              "geography": geography,
              "organization_billing_provider": organization_billing_provider,
              "date_of_service": date_of_service,
              "cpt_code": cpt_code,
              "modifiers": modifiers,
              "license_type": license_type,
              "facility_type_code": facility_type_code,
              "network_types": network_types,
              "payer_plan_groups": payer_plan_groups
            }
          end

          # Deserialize a JSON object to an instance of DimensionMatch
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::DimensionMatch]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["payer"].nil?
              payer = nil
            else
              payer = parsed_json["payer"].to_json
              payer = CandidApiClient::FeeSchedules::V3::Types::MatchPayer.from_json(json_object: payer)
            end
            if parsed_json["geography"].nil?
              geography = nil
            else
              geography = parsed_json["geography"].to_json
              geography = CandidApiClient::FeeSchedules::V3::Types::MatchGeo.from_json(json_object: geography)
            end
            if parsed_json["organization_billing_provider"].nil?
              organization_billing_provider = nil
            else
              organization_billing_provider = parsed_json["organization_billing_provider"].to_json
              organization_billing_provider = CandidApiClient::FeeSchedules::V3::Types::MatchProvider.from_json(json_object: organization_billing_provider)
            end
            if parsed_json["date_of_service"].nil?
              date_of_service = nil
            else
              date_of_service = parsed_json["date_of_service"].to_json
              date_of_service = CandidApiClient::FeeSchedules::V3::Types::MatchDate.from_json(json_object: date_of_service)
            end
            if parsed_json["cpt_code"].nil?
              cpt_code = nil
            else
              cpt_code = parsed_json["cpt_code"].to_json
              cpt_code = CandidApiClient::FeeSchedules::V3::Types::MatchCptCode.from_json(json_object: cpt_code)
            end
            if parsed_json["modifiers"].nil?
              modifiers = nil
            else
              modifiers = parsed_json["modifiers"].to_json
              modifiers = CandidApiClient::FeeSchedules::V3::Types::MatchModifiers.from_json(json_object: modifiers)
            end
            if parsed_json["license_type"].nil?
              license_type = nil
            else
              license_type = parsed_json["license_type"].to_json
              license_type = CandidApiClient::FeeSchedules::V3::Types::MatchLicenseType.from_json(json_object: license_type)
            end
            if parsed_json["facility_type_code"].nil?
              facility_type_code = nil
            else
              facility_type_code = parsed_json["facility_type_code"].to_json
              facility_type_code = CandidApiClient::FeeSchedules::V3::Types::MatchFacilityTypeCode.from_json(json_object: facility_type_code)
            end
            if parsed_json["network_types"].nil?
              network_types = nil
            else
              network_types = parsed_json["network_types"].to_json
              network_types = CandidApiClient::FeeSchedules::V3::Types::MatchNetworkTypes.from_json(json_object: network_types)
            end
            if parsed_json["payer_plan_groups"].nil?
              payer_plan_groups = nil
            else
              payer_plan_groups = parsed_json["payer_plan_groups"].to_json
              payer_plan_groups = CandidApiClient::FeeSchedules::V3::Types::MatchPayerPlanGroups.from_json(json_object: payer_plan_groups)
            end
            new(
              payer: payer,
              geography: geography,
              organization_billing_provider: organization_billing_provider,
              date_of_service: date_of_service,
              cpt_code: cpt_code,
              modifiers: modifiers,
              license_type: license_type,
              facility_type_code: facility_type_code,
              network_types: network_types,
              payer_plan_groups: payer_plan_groups,
              additional_properties: struct
            )
          end

          # Serialize an instance of DimensionMatch to a JSON object
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
            CandidApiClient::FeeSchedules::V3::Types::MatchPayer.validate_raw(obj: obj.payer)
            CandidApiClient::FeeSchedules::V3::Types::MatchGeo.validate_raw(obj: obj.geography)
            CandidApiClient::FeeSchedules::V3::Types::MatchProvider.validate_raw(obj: obj.organization_billing_provider)
            CandidApiClient::FeeSchedules::V3::Types::MatchDate.validate_raw(obj: obj.date_of_service)
            CandidApiClient::FeeSchedules::V3::Types::MatchCptCode.validate_raw(obj: obj.cpt_code)
            CandidApiClient::FeeSchedules::V3::Types::MatchModifiers.validate_raw(obj: obj.modifiers)
            CandidApiClient::FeeSchedules::V3::Types::MatchLicenseType.validate_raw(obj: obj.license_type)
            CandidApiClient::FeeSchedules::V3::Types::MatchFacilityTypeCode.validate_raw(obj: obj.facility_type_code)
            CandidApiClient::FeeSchedules::V3::Types::MatchNetworkTypes.validate_raw(obj: obj.network_types)
            CandidApiClient::FeeSchedules::V3::Types::MatchPayerPlanGroups.validate_raw(obj: obj.payer_plan_groups)
          end
        end
      end
    end
  end
end
