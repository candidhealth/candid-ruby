# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/write_off_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "../../financials/types/account_type"
require_relative "types/write_offs_page"
require_relative "types/write_off"
require_relative "types/write_off_create"
require_relative "types/create_write_offs_response"
require "async"

module CandidApiClient
  module WriteOffs
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::WriteOffs::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all write-offs satisfying the search criteria.
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param patient_external_id [String]
        # @param payer_uuid [String]
        # @param service_line_id [String]
        # @param claim_id [String]
        # @param billing_provider_id [String]
        # @param sort [CandidApiClient::WriteOffs::V1::Types::WriteOffSortField] Defaults to write_off_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param account_types [CandidApiClient::Financials::Types::AccountType] Filters the returned values to include only the provided account types.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::WriteOffs::V1::Types::WriteOffsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.write_offs.v_1.get_multi(
        #    limit: 1,
        #    patient_external_id: "string",
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    sort: AMOUNT_CENTS,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    account_types: PATIENT
        #  )
        def get_multi(limit: nil, patient_external_id: nil, payer_uuid: nil, service_line_id: nil, claim_id: nil,
                      billing_provider_id: nil, sort: nil, sort_direction: nil, page_token: nil, account_types: nil, request_options: nil)
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
              "limit": limit,
              "patient_external_id": patient_external_id,
              "payer_uuid": payer_uuid,
              "service_line_id": service_line_id,
              "claim_id": claim_id,
              "billing_provider_id": billing_provider_id,
              "sort": sort,
              "sort_direction": sort_direction,
              "page_token": page_token,
              "account_types": account_types
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/write-offs/v1"
          end
          CandidApiClient::WriteOffs::V1::Types::WriteOffsPage.from_json(json_object: response.body)
        end

        # Retrieves a previously created write off by its `write_off_id`.
        #
        # @param write_off_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::WriteOffs::V1::Types::WriteOff]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.write_offs.v_1.get(write_off_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(write_off_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/write-offs/v1/#{write_off_id}"
          end
          CandidApiClient::WriteOffs::V1::Types::WriteOff.from_json(json_object: response.body)
        end

        # Creates one or many write-offs applied toward a specific service line,
        #  claim, or billing provider.
        #
        # @param write_offs [Array<Hash>] Request of type Array<CandidApiClient::WriteOffs::V1::Types::WriteOffCreate>, as a Hash
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::WriteOffs::V1::Types::CreateWriteOffsResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.write_offs.v_1.create(write_offs: )
        def create(write_offs:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), write_offs: write_offs }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/write-offs/v1"
          end
          CandidApiClient::WriteOffs::V1::Types::CreateWriteOffsResponse.from_json(json_object: response.body)
        end

        # Reverts a write off given a `write_off_id`.
        #
        # @param write_off_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::WriteOffs::V1::Types::WriteOff]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.write_offs.v_1.revert(write_off_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def revert(write_off_id:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/write-offs/v1/#{write_off_id}/revert"
          end
          CandidApiClient::WriteOffs::V1::Types::WriteOff.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::WriteOffs::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all write-offs satisfying the search criteria.
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param patient_external_id [String]
        # @param payer_uuid [String]
        # @param service_line_id [String]
        # @param claim_id [String]
        # @param billing_provider_id [String]
        # @param sort [CandidApiClient::WriteOffs::V1::Types::WriteOffSortField] Defaults to write_off_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param account_types [CandidApiClient::Financials::Types::AccountType] Filters the returned values to include only the provided account types.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::WriteOffs::V1::Types::WriteOffsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.write_offs.v_1.get_multi(
        #    limit: 1,
        #    patient_external_id: "string",
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    sort: AMOUNT_CENTS,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    account_types: PATIENT
        #  )
        def get_multi(limit: nil, patient_external_id: nil, payer_uuid: nil, service_line_id: nil, claim_id: nil,
                      billing_provider_id: nil, sort: nil, sort_direction: nil, page_token: nil, account_types: nil, request_options: nil)
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
                "limit": limit,
                "patient_external_id": patient_external_id,
                "payer_uuid": payer_uuid,
                "service_line_id": service_line_id,
                "claim_id": claim_id,
                "billing_provider_id": billing_provider_id,
                "sort": sort,
                "sort_direction": sort_direction,
                "page_token": page_token,
                "account_types": account_types
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/write-offs/v1"
            end
            CandidApiClient::WriteOffs::V1::Types::WriteOffsPage.from_json(json_object: response.body)
          end
        end

        # Retrieves a previously created write off by its `write_off_id`.
        #
        # @param write_off_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::WriteOffs::V1::Types::WriteOff]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.write_offs.v_1.get(write_off_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(write_off_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/write-offs/v1/#{write_off_id}"
            end
            CandidApiClient::WriteOffs::V1::Types::WriteOff.from_json(json_object: response.body)
          end
        end

        # Creates one or many write-offs applied toward a specific service line,
        #  claim, or billing provider.
        #
        # @param write_offs [Array<Hash>] Request of type Array<CandidApiClient::WriteOffs::V1::Types::WriteOffCreate>, as a Hash
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::WriteOffs::V1::Types::CreateWriteOffsResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.write_offs.v_1.create(write_offs: )
        def create(write_offs:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request_options&.additional_body_parameters || {}), write_offs: write_offs }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/write-offs/v1"
            end
            CandidApiClient::WriteOffs::V1::Types::CreateWriteOffsResponse.from_json(json_object: response.body)
          end
        end

        # Reverts a write off given a `write_off_id`.
        #
        # @param write_off_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::WriteOffs::V1::Types::WriteOff]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.write_offs.v_1.revert(write_off_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def revert(write_off_id:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/write-offs/v1/#{write_off_id}/revert"
            end
            CandidApiClient::WriteOffs::V1::Types::WriteOff.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
