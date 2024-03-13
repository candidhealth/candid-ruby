# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../payers/v_3/types/payer_uuid"
require_relative "../../commons/types/claim_id"
require_relative "../../commons/types/service_line_id"
require_relative "../../commons/types/provider_id"
require_relative "types/insurance_refund_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "../../commons/types/page_token"
require_relative "types/insurance_refunds_page"
require_relative "types/insurance_refund_id"
require_relative "types/insurance_refund"
require_relative "types/insurance_refund_create"
require "date"
require_relative "../../financials/types/note_update"
require_relative "../../financials/types/refund_reason_update"
require "async"

module CandidApiClient
  module InsuranceRefunds
    module V1
      class V1Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [InsuranceRefunds::V1::V1Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Returns all insurance refunds satisfying the search criteria AND whose organization_id matches
        # the current organization_id of the authenticated user.
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param claim_id [Commons::CLAIM_ID]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param billing_provider_id [Commons::PROVIDER_ID]
        # @param sort [InsuranceRefunds::V1::InsuranceRefundSortField] Defaults to refund_timestamp
        # @param sort_direction [Commons::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [Commons::PAGE_TOKEN]
        # @param request_options [RequestOptions]
        # @return [InsuranceRefunds::V1::InsuranceRefundsPage]
        def get_multi(limit: nil, payer_uuid: nil, claim_id: nil, service_line_id: nil, billing_provider_id: nil,
                      sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
          response = @request_client.conn.get("/api/insurance-refunds/v1") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "payer_uuid": payer_uuid,
              "claim_id": claim_id,
              "service_line_id": service_line_id,
              "billing_provider_id": billing_provider_id,
              "sort": sort,
              "sort_direction": sort_direction,
              "page_token": page_token
            }.compact
          end
          InsuranceRefunds::V1::InsuranceRefundsPage.from_json(json_object: response.body)
        end

        # Retrieves a previously created insurance refund by its `insurance_refund_id`.
        # If the refund does not exist, a `403` will be thrown.
        #
        # @param insurance_refund_id [InsuranceRefunds::V1::INSURANCE_REFUND_ID]
        # @param request_options [RequestOptions]
        # @return [InsuranceRefunds::V1::InsuranceRefund]
        def get(insurance_refund_id:, request_options: nil)
          response = @request_client.conn.get("/api/insurance-refunds/v1/#{insurance_refund_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          InsuranceRefunds::V1::InsuranceRefund.from_json(json_object: response.body)
        end

        # Creates a new insurance refund record and returns the newly created `InsuranceRefund` object.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @param request [Hash] Request of type InsuranceRefunds::V1::InsuranceRefundCreate, as a Hash
        #   * :payer_identifier (Hash)
        #   * :amount_cents (Integer)
        #   * :refund_timestamp (DateTime)
        #   * :refund_note (String)
        #   * :allocations (Array<Financials::AllocationCreate>)
        #   * :refund_reason (Financials::RefundReason)
        # @param request_options [RequestOptions]
        # @return [InsuranceRefunds::V1::InsuranceRefund]
        def create(request:, request_options: nil)
          response = @request_client.conn.post("/api/insurance-refunds/v1") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          InsuranceRefunds::V1::InsuranceRefund.from_json(json_object: response.body)
        end

        # Updates the patient refund record matching the provided insurance_refund_id. If updating the refund amount,
        # then the allocations must be appropriately updated as well.
        #
        # @param insurance_refund_id [InsuranceRefunds::V1::INSURANCE_REFUND_ID]
        # @param refund_timestamp [DateTime]
        # @param refund_note [Financials::NoteUpdate]
        # @param refund_reason [Financials::RefundReasonUpdate]
        # @param request_options [RequestOptions]
        # @return [InsuranceRefunds::V1::InsuranceRefund]
        def update(insurance_refund_id:, refund_timestamp: nil, refund_note: nil, refund_reason: nil,
                   request_options: nil)
          response = @request_client.conn.patch("/api/insurance-refunds/v1/#{insurance_refund_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              refund_timestamp: refund_timestamp,
              refund_note: refund_note,
              refund_reason: refund_reason
            }.compact
          end
          InsuranceRefunds::V1::InsuranceRefund.from_json(json_object: response.body)
        end

        # Deletes the insurance refund record matching the provided `insurance_refund_id`.
        # If the matching record's organization_id does not match the authenticated user's
        # current organization_id, then a response code of `403` will be returned.
        #
        # @param insurance_refund_id [InsuranceRefunds::V1::INSURANCE_REFUND_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(insurance_refund_id:, request_options: nil)
          @request_client.conn.delete("/api/insurance-refunds/v1/#{insurance_refund_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end
      end

      class AsyncV1Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [InsuranceRefunds::V1::AsyncV1Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Returns all insurance refunds satisfying the search criteria AND whose organization_id matches
        # the current organization_id of the authenticated user.
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param claim_id [Commons::CLAIM_ID]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param billing_provider_id [Commons::PROVIDER_ID]
        # @param sort [InsuranceRefunds::V1::InsuranceRefundSortField] Defaults to refund_timestamp
        # @param sort_direction [Commons::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [Commons::PAGE_TOKEN]
        # @param request_options [RequestOptions]
        # @return [InsuranceRefunds::V1::InsuranceRefundsPage]
        def get_multi(limit: nil, payer_uuid: nil, claim_id: nil, service_line_id: nil, billing_provider_id: nil,
                      sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/insurance-refunds/v1") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "payer_uuid": payer_uuid,
                "claim_id": claim_id,
                "service_line_id": service_line_id,
                "billing_provider_id": billing_provider_id,
                "sort": sort,
                "sort_direction": sort_direction,
                "page_token": page_token
              }.compact
            end
            InsuranceRefunds::V1::InsuranceRefundsPage.from_json(json_object: response.body)
          end
        end

        # Retrieves a previously created insurance refund by its `insurance_refund_id`.
        # If the refund does not exist, a `403` will be thrown.
        #
        # @param insurance_refund_id [InsuranceRefunds::V1::INSURANCE_REFUND_ID]
        # @param request_options [RequestOptions]
        # @return [InsuranceRefunds::V1::InsuranceRefund]
        def get(insurance_refund_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/insurance-refunds/v1/#{insurance_refund_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            InsuranceRefunds::V1::InsuranceRefund.from_json(json_object: response.body)
          end
        end

        # Creates a new insurance refund record and returns the newly created `InsuranceRefund` object.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @param request [Hash] Request of type InsuranceRefunds::V1::InsuranceRefundCreate, as a Hash
        #   * :payer_identifier (Hash)
        #   * :amount_cents (Integer)
        #   * :refund_timestamp (DateTime)
        #   * :refund_note (String)
        #   * :allocations (Array<Financials::AllocationCreate>)
        #   * :refund_reason (Financials::RefundReason)
        # @param request_options [RequestOptions]
        # @return [InsuranceRefunds::V1::InsuranceRefund]
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/insurance-refunds/v1") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            InsuranceRefunds::V1::InsuranceRefund.from_json(json_object: response.body)
          end
        end

        # Updates the patient refund record matching the provided insurance_refund_id. If updating the refund amount,
        # then the allocations must be appropriately updated as well.
        #
        # @param insurance_refund_id [InsuranceRefunds::V1::INSURANCE_REFUND_ID]
        # @param refund_timestamp [DateTime]
        # @param refund_note [Financials::NoteUpdate]
        # @param refund_reason [Financials::RefundReasonUpdate]
        # @param request_options [RequestOptions]
        # @return [InsuranceRefunds::V1::InsuranceRefund]
        def update(insurance_refund_id:, refund_timestamp: nil, refund_note: nil, refund_reason: nil,
                   request_options: nil)
          Async do
            response = @request_client.conn.patch("/api/insurance-refunds/v1/#{insurance_refund_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                refund_timestamp: refund_timestamp,
                refund_note: refund_note,
                refund_reason: refund_reason
              }.compact
            end
            InsuranceRefunds::V1::InsuranceRefund.from_json(json_object: response.body)
          end
        end

        # Deletes the insurance refund record matching the provided `insurance_refund_id`.
        # If the matching record's organization_id does not match the authenticated user's
        # current organization_id, then a response code of `403` will be returned.
        #
        # @param insurance_refund_id [InsuranceRefunds::V1::INSURANCE_REFUND_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(insurance_refund_id:, request_options: nil)
          Async do
            @request_client.conn.delete("/api/insurance-refunds/v1/#{insurance_refund_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
          end
        end
      end
    end
  end
end
