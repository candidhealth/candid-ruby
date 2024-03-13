# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/contract_id"
require_relative "types/contract_with_providers"
require_relative "../../commons/types/page_token"
require_relative "types/contracting_provider_id"
require_relative "types/rendering_providerid"
require_relative "../../commons/types/state"
require_relative "types/contract_status"
require_relative "types/contracts_page"
require_relative "../../commons/types/date"
require_relative "../../commons/types/regions"
require_relative "types/authorized_signatory"
require_relative "types/insurance_types"
require "set"
require_relative "types/date_update"
require_relative "types/regions_update"
require_relative "types/authorized_signatory_update"
require "async"

module CandidApiClient
  module Contracts
    module V2
      class V2Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [Contracts::V2::V2Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # @param contract_id [Contracts::V2::CONTRACT_ID]
        # @param request_options [RequestOptions]
        # @return [Contracts::V2::ContractWithProviders]
        def get(contract_id:, request_options: nil)
          response = @request_client.conn.get("/api/contracts/v2/#{contract_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Contracts::V2::ContractWithProviders.from_json(json_object: response.body)
        end

        # @param page_token [Commons::PAGE_TOKEN]
        # @param limit [Integer] Max number of contracts returned. Defaults to 1000. Max is 1000.
        # @param contracting_provider_id [Contracts::V2::CONTRACTING_PROVIDER_ID]
        # @param rendering_provider_ids [Contracts::V2::RENDERING_PROVIDERID]
        # @param payer_names [String] Filter to contracts that include any of the included payer names.
        # @param states [Commons::State]
        # @param contract_status [Contracts::V2::ContractStatus] The status of the contract. Defaults to `pending`
        # @param request_options [RequestOptions]
        # @return [Contracts::V2::ContractsPage]
        def get_multi(page_token: nil, limit: nil, contracting_provider_id: nil, rendering_provider_ids: nil,
                      payer_names: nil, states: nil, contract_status: nil, request_options: nil)
          response = @request_client.conn.get("/api/contracts/v2") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "page_token": page_token,
              "limit": limit,
              "contracting_provider_id": contracting_provider_id,
              "rendering_provider_ids": rendering_provider_ids,
              "payer_names": payer_names,
              "states": states,
              "contract_status": contract_status
            }.compact
          end
          Contracts::V2::ContractsPage.from_json(json_object: response.body)
        end

        # Creates a new contract within the user's current organization
        #
        # @param effective_date [Commons::DATE] The starting day upon which the contract is effective
        # @param expiration_date [Commons::DATE] An optional end day upon which the contract expires
        # @param regions [Commons::Regions] The state(s) to which the contract's coverage extends.
        #   It may also be set to "national" for the entirety of the US.
        # @param contract_status [Contracts::V2::ContractStatus]
        # @param authorized_signatory [Hash] Request of type Contracts::V2::AuthorizedSignatory, as a Hash
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :title (String)
        #   * :email (String)
        #   * :phone (String)
        #   * :fax (String)
        # @param commercial_insurance_types [Contracts::V2::InsuranceTypes] The commercial plan insurance types this contract applies.
        # @param medicare_insurance_types [Contracts::V2::InsuranceTypes] The Medicare plan insurance types this contract applies.
        # @param medicaid_insurance_types [Contracts::V2::InsuranceTypes] The Medicaid plan insurance types this contract applies.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param contracting_provider_id [Contracts::V2::CONTRACTING_PROVIDER_ID] The String of the provider under agreement to the contract
        # @param rendering_provider_ids [Set<Contracts::V2::RENDERING_PROVIDERID>] A rendering provider isn't contracted directly with the payer but can render
        #   services under the contract held by the contracting provider.
        #   Max items is 100.
        # @param payer_uuid [String] The String of the insurance company under agreement to the contract
        # @param request_options [RequestOptions]
        # @return [Contracts::V2::ContractWithProviders]
        def create(effective_date:, regions:, commercial_insurance_types:, medicare_insurance_types:,
                   medicaid_insurance_types:, contracting_provider_id:, rendering_provider_ids:, payer_uuid:, expiration_date: nil, contract_status: nil, authorized_signatory: nil, additional_properties: nil, request_options: nil)
          response = @request_client.conn.post("/api/contracts/v2") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              effective_date: effective_date,
              expiration_date: expiration_date,
              regions: regions,
              contract_status: contract_status,
              authorized_signatory: authorized_signatory,
              commercial_insurance_types: commercial_insurance_types,
              medicare_insurance_types: medicare_insurance_types,
              medicaid_insurance_types: medicaid_insurance_types,
              additional_properties: additional_properties,
              contracting_provider_id: contracting_provider_id,
              rendering_provider_ids: rendering_provider_ids,
              payer_uuid: payer_uuid
            }.compact
          end
          Contracts::V2::ContractWithProviders.from_json(json_object: response.body)
        end

        # @param contract_id [Contracts::V2::CONTRACT_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(contract_id:, request_options: nil)
          @request_client.conn.delete("/api/contracts/v2/#{contract_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end

        # @param contract_id [Contracts::V2::CONTRACT_ID]
        # @param rendering_provider_ids [Set<Contracts::V2::RENDERING_PROVIDERID>] A rendering provider isn't contracted directly with the payer but can render
        #   services under the contract held by the contracting provider.
        #   Max items is 100.
        # @param effective_date [Commons::DATE] The starting day upon which the contract is effective
        # @param expiration_date [Contracts::V2::DateUpdate] An optional end day upon which the contract expires
        # @param regions [Contracts::V2::RegionsUpdate] If present, the contract's rendering providers will be patched to this exact
        #   value, overriding what was set before.
        # @param contract_status [Contracts::V2::ContractStatus]
        # @param authorized_signatory [Contracts::V2::AuthorizedSignatoryUpdate]
        # @param commercial_insurance_types [Contracts::V2::InsuranceTypes]
        # @param medicare_insurance_types [Contracts::V2::InsuranceTypes]
        # @param medicaid_insurance_types [Contracts::V2::InsuranceTypes]
        # @param request_options [RequestOptions]
        # @return [Contracts::V2::ContractWithProviders]
        def update(contract_id:, rendering_provider_ids: nil, effective_date: nil, expiration_date: nil, regions: nil,
                   contract_status: nil, authorized_signatory: nil, commercial_insurance_types: nil, medicare_insurance_types: nil, medicaid_insurance_types: nil, request_options: nil)
          response = @request_client.conn.patch("/api/contracts/v2/#{contract_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              rendering_provider_ids: rendering_provider_ids,
              effective_date: effective_date,
              expiration_date: expiration_date,
              regions: regions,
              contract_status: contract_status,
              authorized_signatory: authorized_signatory,
              commercial_insurance_types: commercial_insurance_types,
              medicare_insurance_types: medicare_insurance_types,
              medicaid_insurance_types: medicaid_insurance_types
            }.compact
          end
          Contracts::V2::ContractWithProviders.from_json(json_object: response.body)
        end
      end

      class AsyncV2Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [Contracts::V2::AsyncV2Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # @param contract_id [Contracts::V2::CONTRACT_ID]
        # @param request_options [RequestOptions]
        # @return [Contracts::V2::ContractWithProviders]
        def get(contract_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/contracts/v2/#{contract_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            Contracts::V2::ContractWithProviders.from_json(json_object: response.body)
          end
        end

        # @param page_token [Commons::PAGE_TOKEN]
        # @param limit [Integer] Max number of contracts returned. Defaults to 1000. Max is 1000.
        # @param contracting_provider_id [Contracts::V2::CONTRACTING_PROVIDER_ID]
        # @param rendering_provider_ids [Contracts::V2::RENDERING_PROVIDERID]
        # @param payer_names [String] Filter to contracts that include any of the included payer names.
        # @param states [Commons::State]
        # @param contract_status [Contracts::V2::ContractStatus] The status of the contract. Defaults to `pending`
        # @param request_options [RequestOptions]
        # @return [Contracts::V2::ContractsPage]
        def get_multi(page_token: nil, limit: nil, contracting_provider_id: nil, rendering_provider_ids: nil,
                      payer_names: nil, states: nil, contract_status: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/contracts/v2") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "page_token": page_token,
                "limit": limit,
                "contracting_provider_id": contracting_provider_id,
                "rendering_provider_ids": rendering_provider_ids,
                "payer_names": payer_names,
                "states": states,
                "contract_status": contract_status
              }.compact
            end
            Contracts::V2::ContractsPage.from_json(json_object: response.body)
          end
        end

        # Creates a new contract within the user's current organization
        #
        # @param effective_date [Commons::DATE] The starting day upon which the contract is effective
        # @param expiration_date [Commons::DATE] An optional end day upon which the contract expires
        # @param regions [Commons::Regions] The state(s) to which the contract's coverage extends.
        #   It may also be set to "national" for the entirety of the US.
        # @param contract_status [Contracts::V2::ContractStatus]
        # @param authorized_signatory [Hash] Request of type Contracts::V2::AuthorizedSignatory, as a Hash
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :title (String)
        #   * :email (String)
        #   * :phone (String)
        #   * :fax (String)
        # @param commercial_insurance_types [Contracts::V2::InsuranceTypes] The commercial plan insurance types this contract applies.
        # @param medicare_insurance_types [Contracts::V2::InsuranceTypes] The Medicare plan insurance types this contract applies.
        # @param medicaid_insurance_types [Contracts::V2::InsuranceTypes] The Medicaid plan insurance types this contract applies.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param contracting_provider_id [Contracts::V2::CONTRACTING_PROVIDER_ID] The String of the provider under agreement to the contract
        # @param rendering_provider_ids [Set<Contracts::V2::RENDERING_PROVIDERID>] A rendering provider isn't contracted directly with the payer but can render
        #   services under the contract held by the contracting provider.
        #   Max items is 100.
        # @param payer_uuid [String] The String of the insurance company under agreement to the contract
        # @param request_options [RequestOptions]
        # @return [Contracts::V2::ContractWithProviders]
        def create(effective_date:, regions:, commercial_insurance_types:, medicare_insurance_types:,
                   medicaid_insurance_types:, contracting_provider_id:, rendering_provider_ids:, payer_uuid:, expiration_date: nil, contract_status: nil, authorized_signatory: nil, additional_properties: nil, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/contracts/v2") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                effective_date: effective_date,
                expiration_date: expiration_date,
                regions: regions,
                contract_status: contract_status,
                authorized_signatory: authorized_signatory,
                commercial_insurance_types: commercial_insurance_types,
                medicare_insurance_types: medicare_insurance_types,
                medicaid_insurance_types: medicaid_insurance_types,
                additional_properties: additional_properties,
                contracting_provider_id: contracting_provider_id,
                rendering_provider_ids: rendering_provider_ids,
                payer_uuid: payer_uuid
              }.compact
            end
            Contracts::V2::ContractWithProviders.from_json(json_object: response.body)
          end
        end

        # @param contract_id [Contracts::V2::CONTRACT_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(contract_id:, request_options: nil)
          Async do
            @request_client.conn.delete("/api/contracts/v2/#{contract_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
          end
        end

        # @param contract_id [Contracts::V2::CONTRACT_ID]
        # @param rendering_provider_ids [Set<Contracts::V2::RENDERING_PROVIDERID>] A rendering provider isn't contracted directly with the payer but can render
        #   services under the contract held by the contracting provider.
        #   Max items is 100.
        # @param effective_date [Commons::DATE] The starting day upon which the contract is effective
        # @param expiration_date [Contracts::V2::DateUpdate] An optional end day upon which the contract expires
        # @param regions [Contracts::V2::RegionsUpdate] If present, the contract's rendering providers will be patched to this exact
        #   value, overriding what was set before.
        # @param contract_status [Contracts::V2::ContractStatus]
        # @param authorized_signatory [Contracts::V2::AuthorizedSignatoryUpdate]
        # @param commercial_insurance_types [Contracts::V2::InsuranceTypes]
        # @param medicare_insurance_types [Contracts::V2::InsuranceTypes]
        # @param medicaid_insurance_types [Contracts::V2::InsuranceTypes]
        # @param request_options [RequestOptions]
        # @return [Contracts::V2::ContractWithProviders]
        def update(contract_id:, rendering_provider_ids: nil, effective_date: nil, expiration_date: nil, regions: nil,
                   contract_status: nil, authorized_signatory: nil, commercial_insurance_types: nil, medicare_insurance_types: nil, medicaid_insurance_types: nil, request_options: nil)
          Async do
            response = @request_client.conn.patch("/api/contracts/v2/#{contract_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                rendering_provider_ids: rendering_provider_ids,
                effective_date: effective_date,
                expiration_date: expiration_date,
                regions: regions,
                contract_status: contract_status,
                authorized_signatory: authorized_signatory,
                commercial_insurance_types: commercial_insurance_types,
                medicare_insurance_types: medicare_insurance_types,
                medicaid_insurance_types: medicaid_insurance_types
              }.compact
            end
            Contracts::V2::ContractWithProviders.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
