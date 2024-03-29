# frozen_string_literal: true

require "set"
require_relative "contract_id"
require_relative "../../../organization_providers/v_2/types/organization_provider"
require_relative "../../../payers/v_3/types/payer"
require_relative "../../../commons/types/date"
require_relative "../../../commons/types/regions"
require_relative "contract_status"
require_relative "authorized_signatory"
require_relative "insurance_types"
require "json"

module CandidApiClient
  module Contracts
    module V2
      class ContractWithProviders
        attr_reader :rendering_provider_ids, :contract_id, :contracting_provider, :provider_count, :payer,
                    :effective_date, :expiration_date, :regions, :contract_status, :authorized_signatory, :commercial_insurance_types, :medicare_insurance_types, :medicaid_insurance_types, :additional_properties

        # @param rendering_provider_ids [Set<UUID>] The providers who can render medical services under the contract
        # @param contract_id [Contracts::V2::CONTRACT_ID]
        # @param contracting_provider [OrganizationProviders::V2::OrganizationProvider] The provider under contract
        # @param provider_count [Integer] The number of linked providers who can render medical services under this contract
        # @param payer [Payers::V3::Payer] The insurance company under contract
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
        # @return [Contracts::V2::ContractWithProviders]
        def initialize(rendering_provider_ids:, contract_id:, contracting_provider:, provider_count:, effective_date:,
                       regions:, commercial_insurance_types:, medicare_insurance_types:, medicaid_insurance_types:, payer: nil, expiration_date: nil, contract_status: nil, authorized_signatory: nil, additional_properties: nil)
          # @type [Set<UUID>] The providers who can render medical services under the contract
          @rendering_provider_ids = rendering_provider_ids
          # @type [Contracts::V2::CONTRACT_ID]
          @contract_id = contract_id
          # @type [OrganizationProviders::V2::OrganizationProvider] The provider under contract
          @contracting_provider = contracting_provider
          # @type [Integer] The number of linked providers who can render medical services under this contract
          @provider_count = provider_count
          # @type [Payers::V3::Payer] The insurance company under contract
          @payer = payer
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

        # Deserialize a JSON object to an instance of ContractWithProviders
        #
        # @param json_object [JSON]
        # @return [Contracts::V2::ContractWithProviders]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["rendering_provider_ids"].nil?
            rendering_provider_ids = nil
          else
            rendering_provider_ids = parsed_json["rendering_provider_ids"].to_json
            rendering_provider_ids = Set.new(rendering_provider_ids)
          end
          contract_id = struct.contract_id
          if parsed_json["contracting_provider"].nil?
            contracting_provider = nil
          else
            contracting_provider = parsed_json["contracting_provider"].to_json
            contracting_provider = OrganizationProviders::V2::OrganizationProvider.from_json(json_object: contracting_provider)
          end
          provider_count = struct.provider_count
          if parsed_json["payer"].nil?
            payer = nil
          else
            payer = parsed_json["payer"].to_json
            payer = Payers::V3::Payer.from_json(json_object: payer)
          end
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
          new(rendering_provider_ids: rendering_provider_ids, contract_id: contract_id,
              contracting_provider: contracting_provider, provider_count: provider_count, payer: payer, effective_date: effective_date, expiration_date: expiration_date, regions: regions, contract_status: contract_status, authorized_signatory: authorized_signatory, commercial_insurance_types: commercial_insurance_types, medicare_insurance_types: medicare_insurance_types, medicaid_insurance_types: medicaid_insurance_types, additional_properties: struct)
        end

        # Serialize an instance of ContractWithProviders to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "rendering_provider_ids": @rendering_provider_ids,
            "contract_id": @contract_id,
            "contracting_provider": @contracting_provider,
            "provider_count": @provider_count,
            "payer": @payer,
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
          obj.rendering_provider_ids.is_a?(Set) != false || raise("Passed value for field obj.rendering_provider_ids is not the expected type, validation failed.")
          obj.contract_id.is_a?(UUID) != false || raise("Passed value for field obj.contract_id is not the expected type, validation failed.")
          OrganizationProviders::V2::OrganizationProvider.validate_raw(obj: obj.contracting_provider)
          obj.provider_count.is_a?(Integer) != false || raise("Passed value for field obj.provider_count is not the expected type, validation failed.")
          obj.payer.nil? || Payers::V3::Payer.validate_raw(obj: obj.payer)
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
