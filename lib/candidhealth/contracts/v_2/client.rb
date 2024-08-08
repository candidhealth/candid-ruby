# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/contract_with_providers"
require_relative "../../commons/types/state"
require_relative "types/contract_status"
require_relative "types/contracts_page"
require_relative "../../commons/types/regions"
require_relative "types/authorized_signatory"
require_relative "types/insurance_types"
require "ostruct"
require "set"
require_relative "types/date_update"
require_relative "types/regions_update"
require_relative "types/authorized_signatory_update"
require "async"

module CandidApiClient
  module Contracts
    module V2
      class V2Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::Contracts::V2::V2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param contract_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Contracts::V2::Types::ContractWithProviders]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.contracts.v_2.get(contract_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(contract_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/contracts/v2/#{contract_id}"
          end
          CandidApiClient::Contracts::V2::Types::ContractWithProviders.from_json(json_object: response.body)
        end

        # @param page_token [String]
        # @param limit [Integer] Max number of contracts returned. Defaults to 1000. Max is 1000.
        # @param contracting_provider_id [String]
        # @param rendering_provider_ids [String]
        # @param payer_names [String] Filter to contracts that include any of the included payer names.
        # @param states [CandidApiClient::Commons::Types::State]
        # @param contract_status [CandidApiClient::Contracts::V2::Types::ContractStatus] The status of the contract. Defaults to `pending`
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Contracts::V2::Types::ContractsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.contracts.v_2.get_multi(
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    limit: 1,
        #    contracting_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    rendering_provider_ids: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    payer_names: "string",
        #    states: AA,
        #    contract_status: PENDING
        #  )
        def get_multi(page_token: nil, limit: nil, contracting_provider_id: nil, rendering_provider_ids: nil,
                      payer_names: nil, states: nil, contract_status: nil, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
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
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/contracts/v2"
          end
          CandidApiClient::Contracts::V2::Types::ContractsPage.from_json(json_object: response.body)
        end

        # Creates a new contract within the user's current organization
        #
        # @param effective_date [String] The starting day upon which the contract is effective
        # @param expiration_date [String] An optional end day upon which the contract expires
        # @param regions [CandidApiClient::Commons::Types::Regions] The state(s) to which the contract's coverage extends.
        #  It may also be set to "national" for the entirety of the US.
        # @param contract_status [CandidApiClient::Contracts::V2::Types::ContractStatus]
        # @param authorized_signatory [Hash] Request of type CandidApiClient::Contracts::V2::Types::AuthorizedSignatory, as a Hash
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :title (String)
        #   * :email (String)
        #   * :phone (String)
        #   * :fax (String)
        # @param commercial_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The commercial plan insurance types this contract applies.
        # @param medicare_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The Medicare plan insurance types this contract applies.
        # @param medicaid_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The Medicaid plan insurance types this contract applies.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param _field_set [Object]
        # @param contracting_provider_id [String] The UUID of the provider under agreement to the contract
        # @param rendering_provider_ids [Set<String>] A rendering provider isn't contracted directly with the payer but can render
        #  services under the contract held by the contracting provider.
        #  Max items is 100.
        # @param payer_uuid [String] The UUID of the insurance company under agreement to the contract
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Contracts::V2::Types::ContractWithProviders]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.contracts.v_2.create(
        #    contracting_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    rendering_provider_ids: Set["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"],
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"
        #  )
        def create(effective_date:, regions:, commercial_insurance_types:, medicare_insurance_types:,
                   medicaid_insurance_types:, contracting_provider_id:, rendering_provider_ids:, payer_uuid:, expiration_date: nil, contract_status: nil, authorized_signatory: nil, additional_properties: nil, _field_set: nil, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
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
              _field_set: _field_set,
              contracting_provider_id: contracting_provider_id,
              rendering_provider_ids: rendering_provider_ids,
              payer_uuid: payer_uuid
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/contracts/v2"
          end
          CandidApiClient::Contracts::V2::Types::ContractWithProviders.from_json(json_object: response.body)
        end

        # @param contract_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.contracts.v_2.delete(contract_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(contract_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/contracts/v2/#{contract_id}"
          end
        end

        # @param contract_id [String]
        # @param rendering_provider_ids [Set<String>] A rendering provider isn't contracted directly with the payer but can render
        #  services under the contract held by the contracting provider.
        #  Max items is 100.
        # @param effective_date [String] The starting day upon which the contract is effective
        # @param expiration_date [CandidApiClient::Contracts::V2::Types::DateUpdate] An optional end day upon which the contract expires
        # @param regions [CandidApiClient::Contracts::V2::Types::RegionsUpdate] If present, the contract's rendering providers will be patched to this exact
        #  value, overriding what was set before.
        # @param contract_status [CandidApiClient::Contracts::V2::Types::ContractStatus]
        # @param authorized_signatory [CandidApiClient::Contracts::V2::Types::AuthorizedSignatoryUpdate]
        # @param commercial_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes]
        # @param medicare_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes]
        # @param medicaid_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Contracts::V2::Types::ContractWithProviders]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.contracts.v_2.update(
        #    contract_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    rendering_provider_ids: Set["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"],
        #    effective_date: "string",
        #    contract_status: PENDING
        #  )
        def update(contract_id:, rendering_provider_ids: nil, effective_date: nil, expiration_date: nil, regions: nil,
                   contract_status: nil, authorized_signatory: nil, commercial_insurance_types: nil, medicare_insurance_types: nil, medicaid_insurance_types: nil, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
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
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/contracts/v2/#{contract_id}"
          end
          CandidApiClient::Contracts::V2::Types::ContractWithProviders.from_json(json_object: response.body)
        end
      end

      class AsyncV2Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::Contracts::V2::AsyncV2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param contract_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Contracts::V2::Types::ContractWithProviders]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.contracts.v_2.get(contract_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(contract_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/contracts/v2/#{contract_id}"
            end
            CandidApiClient::Contracts::V2::Types::ContractWithProviders.from_json(json_object: response.body)
          end
        end

        # @param page_token [String]
        # @param limit [Integer] Max number of contracts returned. Defaults to 1000. Max is 1000.
        # @param contracting_provider_id [String]
        # @param rendering_provider_ids [String]
        # @param payer_names [String] Filter to contracts that include any of the included payer names.
        # @param states [CandidApiClient::Commons::Types::State]
        # @param contract_status [CandidApiClient::Contracts::V2::Types::ContractStatus] The status of the contract. Defaults to `pending`
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Contracts::V2::Types::ContractsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.contracts.v_2.get_multi(
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    limit: 1,
        #    contracting_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    rendering_provider_ids: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    payer_names: "string",
        #    states: AA,
        #    contract_status: PENDING
        #  )
        def get_multi(page_token: nil, limit: nil, contracting_provider_id: nil, rendering_provider_ids: nil,
                      payer_names: nil, states: nil, contract_status: nil, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
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
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/contracts/v2"
            end
            CandidApiClient::Contracts::V2::Types::ContractsPage.from_json(json_object: response.body)
          end
        end

        # Creates a new contract within the user's current organization
        #
        # @param effective_date [String] The starting day upon which the contract is effective
        # @param expiration_date [String] An optional end day upon which the contract expires
        # @param regions [CandidApiClient::Commons::Types::Regions] The state(s) to which the contract's coverage extends.
        #  It may also be set to "national" for the entirety of the US.
        # @param contract_status [CandidApiClient::Contracts::V2::Types::ContractStatus]
        # @param authorized_signatory [Hash] Request of type CandidApiClient::Contracts::V2::Types::AuthorizedSignatory, as a Hash
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :title (String)
        #   * :email (String)
        #   * :phone (String)
        #   * :fax (String)
        # @param commercial_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The commercial plan insurance types this contract applies.
        # @param medicare_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The Medicare plan insurance types this contract applies.
        # @param medicaid_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes] The Medicaid plan insurance types this contract applies.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param _field_set [Object]
        # @param contracting_provider_id [String] The UUID of the provider under agreement to the contract
        # @param rendering_provider_ids [Set<String>] A rendering provider isn't contracted directly with the payer but can render
        #  services under the contract held by the contracting provider.
        #  Max items is 100.
        # @param payer_uuid [String] The UUID of the insurance company under agreement to the contract
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Contracts::V2::Types::ContractWithProviders]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.contracts.v_2.create(
        #    contracting_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    rendering_provider_ids: Set["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"],
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"
        #  )
        def create(effective_date:, regions:, commercial_insurance_types:, medicare_insurance_types:,
                   medicaid_insurance_types:, contracting_provider_id:, rendering_provider_ids:, payer_uuid:, expiration_date: nil, contract_status: nil, authorized_signatory: nil, additional_properties: nil, _field_set: nil, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
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
                _field_set: _field_set,
                contracting_provider_id: contracting_provider_id,
                rendering_provider_ids: rendering_provider_ids,
                payer_uuid: payer_uuid
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/contracts/v2"
            end
            CandidApiClient::Contracts::V2::Types::ContractWithProviders.from_json(json_object: response.body)
          end
        end

        # @param contract_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.contracts.v_2.delete(contract_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(contract_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/contracts/v2/#{contract_id}"
            end
          end
        end

        # @param contract_id [String]
        # @param rendering_provider_ids [Set<String>] A rendering provider isn't contracted directly with the payer but can render
        #  services under the contract held by the contracting provider.
        #  Max items is 100.
        # @param effective_date [String] The starting day upon which the contract is effective
        # @param expiration_date [CandidApiClient::Contracts::V2::Types::DateUpdate] An optional end day upon which the contract expires
        # @param regions [CandidApiClient::Contracts::V2::Types::RegionsUpdate] If present, the contract's rendering providers will be patched to this exact
        #  value, overriding what was set before.
        # @param contract_status [CandidApiClient::Contracts::V2::Types::ContractStatus]
        # @param authorized_signatory [CandidApiClient::Contracts::V2::Types::AuthorizedSignatoryUpdate]
        # @param commercial_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes]
        # @param medicare_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes]
        # @param medicaid_insurance_types [CandidApiClient::Contracts::V2::Types::InsuranceTypes]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Contracts::V2::Types::ContractWithProviders]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.contracts.v_2.update(
        #    contract_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    rendering_provider_ids: Set["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"],
        #    effective_date: "string",
        #    contract_status: PENDING
        #  )
        def update(contract_id:, rendering_provider_ids: nil, effective_date: nil, expiration_date: nil, regions: nil,
                   contract_status: nil, authorized_signatory: nil, commercial_insurance_types: nil, medicare_insurance_types: nil, medicaid_insurance_types: nil, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
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
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/contracts/v2/#{contract_id}"
            end
            CandidApiClient::Contracts::V2::Types::ContractWithProviders.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
