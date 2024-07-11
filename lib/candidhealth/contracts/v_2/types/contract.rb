# frozen_string_literal: true

require_relative "../../../organization_providers/v_2/types/organization_provider"
require_relative "../../../payers/v_3/types/payer"
require_relative "../../../commons/types/regions"
require_relative "contract_status"
require_relative "authorized_signatory"
require_relative "insurance_types"
require "ostruct"
require "json"

module CandidApiClient
  module Contracts
    module V2
      module Types
        class Contract
          # @return [String]
          attr_reader :contract_id
          # @return [CandidApiClient::OrganizationProviders::V2::Types::OrganizationProvider] The provider under contract
          attr_reader :contracting_provider
          # @return [Integer] The number of linked providers who can render medical services under this
          #  contract
          attr_reader :provider_count
          # @return [CandidApiClient::Payers::V3::Types::Payer] The insurance company under contract
          attr_reader :payer
          # @return [String] The starting day upon which the contract is effective
          attr_reader :effective_date
          # @return [String] An optional end day upon which the contract expires
          attr_reader :expiration_date
          # @return [CandidApiClient::Commons::Types::Regions] The state(s) to which the contract's coverage extends.
          #  It may also be set to "national" for the entirety of the US.
          attr_reader :regions
          # @return [CandidApiClient::Contracts::V2::Types::ContractStatus]
          attr_reader :contract_status
          # @return [CandidApiClient::Contracts::V2::Types::AuthorizedSignatory]
          attr_reader :authorized_signatory
          # @return [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The commercial plan insurance types this contract applies.
          attr_reader :commercial_insurance_types
          # @return [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The Medicare plan insurance types this contract applies.
          attr_reader :medicare_insurance_types
          # @return [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The Medicaid plan insurance types this contract applies.
          attr_reader :medicaid_insurance_types
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param contract_id [String]
          # @param contracting_provider [CandidApiClient::OrganizationProviders::V2::Types::OrganizationProvider] The provider under contract
          # @param provider_count [Integer] The number of linked providers who can render medical services under this
          #  contract
          # @param payer [CandidApiClient::Payers::V3::Types::Payer] The insurance company under contract
          # @param effective_date [String] The starting day upon which the contract is effective
          # @param expiration_date [String] An optional end day upon which the contract expires
          # @param regions [CandidApiClient::Commons::Types::Regions] The state(s) to which the contract's coverage extends.
          #  It may also be set to "national" for the entirety of the US.
          # @param contract_status [CandidApiClient::Contracts::V2::Types::ContractStatus]
          # @param authorized_signatory [CandidApiClient::Contracts::V2::Types::AuthorizedSignatory]
          # @param commercial_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The commercial plan insurance types this contract applies.
          # @param medicare_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The Medicare plan insurance types this contract applies.
          # @param medicaid_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The Medicaid plan insurance types this contract applies.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Contracts::V2::Types::Contract]
          def initialize(contract_id:, contracting_provider:, provider_count:, payer:, effective_date:, regions:, commercial_insurance_types:, medicare_insurance_types:, medicaid_insurance_types:,
                         expiration_date: OMIT, contract_status: OMIT, authorized_signatory: OMIT, additional_properties: nil)
            @contract_id = contract_id
            @contracting_provider = contracting_provider
            @provider_count = provider_count
            @payer = payer
            @effective_date = effective_date
            @expiration_date = expiration_date if expiration_date != OMIT
            @regions = regions
            @contract_status = contract_status if contract_status != OMIT
            @authorized_signatory = authorized_signatory if authorized_signatory != OMIT
            @commercial_insurance_types = commercial_insurance_types
            @medicare_insurance_types = medicare_insurance_types
            @medicaid_insurance_types = medicaid_insurance_types
            @additional_properties = additional_properties
            @_field_set = {
              "contract_id": contract_id,
              "contracting_provider": contracting_provider,
              "provider_count": provider_count,
              "payer": payer,
              "effective_date": effective_date,
              "expiration_date": expiration_date,
              "regions": regions,
              "contract_status": contract_status,
              "authorized_signatory": authorized_signatory,
              "commercial_insurance_types": commercial_insurance_types,
              "medicare_insurance_types": medicare_insurance_types,
              "medicaid_insurance_types": medicaid_insurance_types
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of Contract
          #
          # @param json_object [String]
          # @return [CandidApiClient::Contracts::V2::Types::Contract]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            contract_id = struct["contract_id"]
            if parsed_json["contracting_provider"].nil?
              contracting_provider = nil
            else
              contracting_provider = parsed_json["contracting_provider"].to_json
              contracting_provider = CandidApiClient::OrganizationProviders::V2::Types::OrganizationProvider.from_json(json_object: contracting_provider)
            end
            provider_count = struct["provider_count"]
            if parsed_json["payer"].nil?
              payer = nil
            else
              payer = parsed_json["payer"].to_json
              payer = CandidApiClient::Payers::V3::Types::Payer.from_json(json_object: payer)
            end
            effective_date = struct["effective_date"]
            expiration_date = struct["expiration_date"]
            if parsed_json["regions"].nil?
              regions = nil
            else
              regions = parsed_json["regions"].to_json
              regions = CandidApiClient::Commons::Types::Regions.from_json(json_object: regions)
            end
            contract_status = struct["contract_status"]
            if parsed_json["authorized_signatory"].nil?
              authorized_signatory = nil
            else
              authorized_signatory = parsed_json["authorized_signatory"].to_json
              authorized_signatory = CandidApiClient::Contracts::V2::Types::AuthorizedSignatory.from_json(json_object: authorized_signatory)
            end
            if parsed_json["commercial_insurance_types"].nil?
              commercial_insurance_types = nil
            else
              commercial_insurance_types = parsed_json["commercial_insurance_types"].to_json
              commercial_insurance_types = CandidApiClient::Contracts::V2::Types::InsuranceTypes.from_json(json_object: commercial_insurance_types)
            end
            if parsed_json["medicare_insurance_types"].nil?
              medicare_insurance_types = nil
            else
              medicare_insurance_types = parsed_json["medicare_insurance_types"].to_json
              medicare_insurance_types = CandidApiClient::Contracts::V2::Types::InsuranceTypes.from_json(json_object: medicare_insurance_types)
            end
            if parsed_json["medicaid_insurance_types"].nil?
              medicaid_insurance_types = nil
            else
              medicaid_insurance_types = parsed_json["medicaid_insurance_types"].to_json
              medicaid_insurance_types = CandidApiClient::Contracts::V2::Types::InsuranceTypes.from_json(json_object: medicaid_insurance_types)
            end
            new(
              contract_id: contract_id,
              contracting_provider: contracting_provider,
              provider_count: provider_count,
              payer: payer,
              effective_date: effective_date,
              expiration_date: expiration_date,
              regions: regions,
              contract_status: contract_status,
              authorized_signatory: authorized_signatory,
              commercial_insurance_types: commercial_insurance_types,
              medicare_insurance_types: medicare_insurance_types,
              medicaid_insurance_types: medicaid_insurance_types,
              additional_properties: struct
            )
          end

          # Serialize an instance of Contract to a JSON object
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
            obj.contract_id.is_a?(String) != false || raise("Passed value for field obj.contract_id is not the expected type, validation failed.")
            CandidApiClient::OrganizationProviders::V2::Types::OrganizationProvider.validate_raw(obj: obj.contracting_provider)
            obj.provider_count.is_a?(Integer) != false || raise("Passed value for field obj.provider_count is not the expected type, validation failed.")
            CandidApiClient::Payers::V3::Types::Payer.validate_raw(obj: obj.payer)
            obj.effective_date.is_a?(String) != false || raise("Passed value for field obj.effective_date is not the expected type, validation failed.")
            obj.expiration_date&.is_a?(String) != false || raise("Passed value for field obj.expiration_date is not the expected type, validation failed.")
            CandidApiClient::Commons::Types::Regions.validate_raw(obj: obj.regions)
            obj.contract_status&.is_a?(CandidApiClient::Contracts::V2::Types::ContractStatus) != false || raise("Passed value for field obj.contract_status is not the expected type, validation failed.")
            obj.authorized_signatory.nil? || CandidApiClient::Contracts::V2::Types::AuthorizedSignatory.validate_raw(obj: obj.authorized_signatory)
            CandidApiClient::Contracts::V2::Types::InsuranceTypes.validate_raw(obj: obj.commercial_insurance_types)
            CandidApiClient::Contracts::V2::Types::InsuranceTypes.validate_raw(obj: obj.medicare_insurance_types)
            CandidApiClient::Contracts::V2::Types::InsuranceTypes.validate_raw(obj: obj.medicaid_insurance_types)
          end
        end
      end
    end
  end
end
