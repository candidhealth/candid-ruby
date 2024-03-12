# frozen_string_literal: true

require_relative "../../../commons/types/date"
require_relative "../../../commons/types/regions"
require_relative "contract_status"
require_relative "authorized_signatory"
require_relative "insurance_types"
require "json"

module CandidApiClient
  module Contracts
    module V2
      class ContractBase
        attr_reader :effective_date, :expiration_date, :regions, :contract_status, :authorized_signatory,
                    :commercial_insurance_types, :medicare_insurance_types, :medicaid_insurance_types, :additional_properties

        # @param effective_date [Commons::DATE] The starting day upon which the contract is effective
        # @param expiration_date [Commons::DATE] An optional end day upon which the contract expires
        # @param regions [Commons::Regions] The state(s) to which the contract's coverage extends.
        #   It may also be set to "national" for the entirety of the US.
        # @param contract_status [Contracts::V2::ContractStatus]
        # @param authorized_signatory [Contracts::V2::AuthorizedSignatory]
        # @param commercial_insurance_types [Contracts::V2::InsuranceTypes] The commercial plan insurance types this contract applies.
        # @param medicare_insurance_types [Contracts::V2::InsuranceTypes] The Medicare plan insurance types this contract applies.
        # @param medicaid_insurance_types [Contracts::V2::InsuranceTypes] The Medicaid plan insurance types this contract applies.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Contracts::V2::ContractBase]
        def initialize(effective_date:, regions:, commercial_insurance_types:, medicare_insurance_types:, medicaid_insurance_types:, expiration_date: nil, contract_status: nil,
                       authorized_signatory: nil, additional_properties: nil)
          # @type [Commons::DATE] The starting day upon which the contract is effective
          @effective_date = effective_date
          # @type [Commons::DATE] An optional end day upon which the contract expires
          @expiration_date = expiration_date
          # @type [Commons::Regions] The state(s) to which the contract's coverage extends.
          #   It may also be set to "national" for the entirety of the US.
          @regions = regions
          # @type [Contracts::V2::ContractStatus]
          @contract_status = contract_status
          # @type [Contracts::V2::AuthorizedSignatory]
          @authorized_signatory = authorized_signatory
          # @type [Contracts::V2::InsuranceTypes] The commercial plan insurance types this contract applies.
          @commercial_insurance_types = commercial_insurance_types
          # @type [Contracts::V2::InsuranceTypes] The Medicare plan insurance types this contract applies.
          @medicare_insurance_types = medicare_insurance_types
          # @type [Contracts::V2::InsuranceTypes] The Medicaid plan insurance types this contract applies.
          @medicaid_insurance_types = medicaid_insurance_types
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ContractBase
        #
        # @param json_object [JSON]
        # @return [Contracts::V2::ContractBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          effective_date = struct.effective_date
          expiration_date = struct.expiration_date
          if parsed_json["regions"].nil?
            regions = nil
          else
            regions = parsed_json["regions"].to_json
            regions = Commons::Regions.from_json(json_object: regions)
          end
          contract_status = struct.contract_status
          if parsed_json["authorized_signatory"].nil?
            authorized_signatory = nil
          else
            authorized_signatory = parsed_json["authorized_signatory"].to_json
            authorized_signatory = Contracts::V2::AuthorizedSignatory.from_json(json_object: authorized_signatory)
          end
          if parsed_json["commercial_insurance_types"].nil?
            commercial_insurance_types = nil
          else
            commercial_insurance_types = parsed_json["commercial_insurance_types"].to_json
            commercial_insurance_types = Contracts::V2::InsuranceTypes.from_json(json_object: commercial_insurance_types)
          end
          if parsed_json["medicare_insurance_types"].nil?
            medicare_insurance_types = nil
          else
            medicare_insurance_types = parsed_json["medicare_insurance_types"].to_json
            medicare_insurance_types = Contracts::V2::InsuranceTypes.from_json(json_object: medicare_insurance_types)
          end
          if parsed_json["medicaid_insurance_types"].nil?
            medicaid_insurance_types = nil
          else
            medicaid_insurance_types = parsed_json["medicaid_insurance_types"].to_json
            medicaid_insurance_types = Contracts::V2::InsuranceTypes.from_json(json_object: medicaid_insurance_types)
          end
          new(effective_date: effective_date, expiration_date: expiration_date, regions: regions,
              contract_status: contract_status, authorized_signatory: authorized_signatory, commercial_insurance_types: commercial_insurance_types, medicare_insurance_types: medicare_insurance_types, medicaid_insurance_types: medicaid_insurance_types, additional_properties: struct)
        end

        # Serialize an instance of ContractBase to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "effective_date": @effective_date,
            "expiration_date": @expiration_date,
            "regions": @regions,
            "contract_status": @contract_status,
            "authorized_signatory": @authorized_signatory,
            "commercial_insurance_types": @commercial_insurance_types,
            "medicare_insurance_types": @medicare_insurance_types,
            "medicaid_insurance_types": @medicaid_insurance_types
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.effective_date.is_a?(String) != false || raise("Passed value for field obj.effective_date is not the expected type, validation failed.")
          obj.expiration_date&.is_a?(String) != false || raise("Passed value for field obj.expiration_date is not the expected type, validation failed.")
          Commons::Regions.validate_raw(obj: obj.regions)
          obj.contract_status&.is_a?(Contracts::V2::ContractStatus) != false || raise("Passed value for field obj.contract_status is not the expected type, validation failed.")
          obj.authorized_signatory.nil? || Contracts::V2::AuthorizedSignatory.validate_raw(obj: obj.authorized_signatory)
          Contracts::V2::InsuranceTypes.validate_raw(obj: obj.commercial_insurance_types)
          Contracts::V2::InsuranceTypes.validate_raw(obj: obj.medicare_insurance_types)
          Contracts::V2::InsuranceTypes.validate_raw(obj: obj.medicaid_insurance_types)
        end
      end
    end
  end
end
