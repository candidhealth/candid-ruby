# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../commons/types/patient_external_id"
require_relative "../../payers/v_3/types/payer_uuid"
require_relative "../../commons/types/service_line_id"
require_relative "../../commons/types/claim_id"
require_relative "../../commons/types/provider_id"
require_relative "types/write_off_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "../../commons/types/page_token"
require_relative "../../financials/types/account_type"
require_relative "types/write_offs_page"
require_relative "types/write_off_id"
require_relative "types/write_off"
require_relative "types/write_off_create"
require_relative "types/create_write_offs_response"
require "async"

module CandidApiClient
  module WriteOffs
    module V1
      class V1Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [WriteOffs::V1::V1Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Returns all write-offs satisfying the search criteria.
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param payer_uuid [Payers::V3::PAYER_String]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param claim_id [Commons::CLAIM_ID]
        # @param billing_provider_id [Commons::PROVIDER_ID]
        # @param sort [WriteOffs::V1::WriteOffSortField] Defaults to write_off_timestamp
        # @param sort_direction [Commons::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [Commons::PAGE_TOKEN]
        # @param account_types [Financials::AccountType] Filters the returned values to include only the provided account types.
        # @param request_options [RequestOptions]
        # @return [WriteOffs::V1::WriteOffsPage]
        def get_multi(limit: nil, patient_external_id: nil, payer_uuid: nil, service_line_id: nil, claim_id: nil,
                      billing_provider_id: nil, sort: nil, sort_direction: nil, page_token: nil, account_types: nil, request_options: nil)
          response = @request_client.conn.get("/api/write-offs/v1") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
          end
          WriteOffs::V1::WriteOffsPage.from_json(json_object: response.body)
        end

        # Retrieves a previously created write off by its `write_off_id`.
        #
        # @param write_off_id [WriteOffs::V1::WRITE_OFF_ID]
        # @param request_options [RequestOptions]
        # @return [WriteOffs::V1::WriteOff]
        def get(write_off_id:, request_options: nil)
          response = @request_client.conn.get("/api/write-offs/v1/#{write_off_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          WriteOffs::V1::WriteOff.from_json(json_object: response.body)
        end

        # Creates one or many write-offs given a specific set of allocations.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @param write_offs [Array<Hash>] Request of type Array<WriteOffs::V1::WriteOffCreate>, as a Hash
        # @param request_options [RequestOptions]
        # @return [WriteOffs::V1::CreateWriteOffsResponse]
        def create(write_offs:, request_options: nil)
          response = @request_client.conn.post("/api/write-offs/v1") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), write_offs: write_offs }.compact
          end
          WriteOffs::V1::CreateWriteOffsResponse.from_json(json_object: response.body)
        end

        # Reverts a write off given a `write_off_id`.
        #
        # @param write_off_id [WriteOffs::V1::WRITE_OFF_ID]
        # @param request_options [RequestOptions]
        # @return [WriteOffs::V1::WriteOff]
        def revert(write_off_id:, request_options: nil)
          response = @request_client.conn.post("/api/write-offs/v1/#{write_off_id}/revert") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          WriteOffs::V1::WriteOff.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [WriteOffs::V1::AsyncV1Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Returns all write-offs satisfying the search criteria.
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param payer_uuid [Payers::V3::PAYER_String]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param claim_id [Commons::CLAIM_ID]
        # @param billing_provider_id [Commons::PROVIDER_ID]
        # @param sort [WriteOffs::V1::WriteOffSortField] Defaults to write_off_timestamp
        # @param sort_direction [Commons::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [Commons::PAGE_TOKEN]
        # @param account_types [Financials::AccountType] Filters the returned values to include only the provided account types.
        # @param request_options [RequestOptions]
        # @return [WriteOffs::V1::WriteOffsPage]
        def get_multi(limit: nil, patient_external_id: nil, payer_uuid: nil, service_line_id: nil, claim_id: nil,
                      billing_provider_id: nil, sort: nil, sort_direction: nil, page_token: nil, account_types: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/write-offs/v1") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
            end
            WriteOffs::V1::WriteOffsPage.from_json(json_object: response.body)
          end
        end

        # Retrieves a previously created write off by its `write_off_id`.
        #
        # @param write_off_id [WriteOffs::V1::WRITE_OFF_ID]
        # @param request_options [RequestOptions]
        # @return [WriteOffs::V1::WriteOff]
        def get(write_off_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/write-offs/v1/#{write_off_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            WriteOffs::V1::WriteOff.from_json(json_object: response.body)
          end
        end

        # Creates one or many write-offs given a specific set of allocations.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @param write_offs [Array<Hash>] Request of type Array<WriteOffs::V1::WriteOffCreate>, as a Hash
        # @param request_options [RequestOptions]
        # @return [WriteOffs::V1::CreateWriteOffsResponse]
        def create(write_offs:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/write-offs/v1") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request_options&.additional_body_parameters || {}), write_offs: write_offs }.compact
            end
            WriteOffs::V1::CreateWriteOffsResponse.from_json(json_object: response.body)
          end
        end

        # Reverts a write off given a `write_off_id`.
        #
        # @param write_off_id [WriteOffs::V1::WRITE_OFF_ID]
        # @param request_options [RequestOptions]
        # @return [WriteOffs::V1::WriteOff]
        def revert(write_off_id:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/write-offs/v1/#{write_off_id}/revert") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            WriteOffs::V1::WriteOff.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
