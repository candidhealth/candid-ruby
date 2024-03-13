# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../payers/v_3/types/payer_uuid"
require_relative "../../commons/types/claim_id"
require_relative "../../commons/types/service_line_id"
require_relative "../../commons/types/provider_id"
require_relative "types/insurance_payment_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "../../commons/types/page_token"
require_relative "types/insurance_payments_page"
require_relative "types/insurance_payment_id"
require_relative "types/insurance_payment"
require_relative "types/insurance_payment_create"
require "date"
require_relative "../../financials/types/note_update"
require "async"

module CandidApiClient
  module InsurancePayments
    module V1
      class V1Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [InsurancePayments::V1::V1Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Returns all non-ERA originated insurance payments satisfying the search criteria
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param payer_uuid [Payers::V3::PAYER_String]
        # @param claim_id [Commons::CLAIM_ID]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param billing_provider_id [Commons::PROVIDER_ID]
        # @param sort [InsurancePayments::V1::InsurancePaymentSortField] Defaults to payment_timestamp
        # @param sort_direction [Commons::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [Commons::PAGE_TOKEN]
        # @param request_options [RequestOptions]
        # @return [InsurancePayments::V1::InsurancePaymentsPage]
        def get_multi(limit: nil, payer_uuid: nil, claim_id: nil, service_line_id: nil, billing_provider_id: nil,
                      sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
          response = @request_client.conn.get("/api/insurance-payments/v1") do |req|
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
          InsurancePayments::V1::InsurancePaymentsPage.from_json(json_object: response.body)
        end

        # Retrieves a previously created insurance payment by its `insurance_payment_id`.
        # If the payment does not exist, a `403` will be thrown.
        #
        # @param insurance_payment_id [InsurancePayments::V1::INSURANCE_PAYMENT_ID]
        # @param request_options [RequestOptions]
        # @return [InsurancePayments::V1::InsurancePayment]
        def get(insurance_payment_id:, request_options: nil)
          response = @request_client.conn.get("/api/insurance-payments/v1/#{insurance_payment_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          InsurancePayments::V1::InsurancePayment.from_json(json_object: response.body)
        end

        # Creates a new insurance payment record and returns the newly created `InsurancePayment` object. This endpoint
        # should only be used for insurance payments that do not have a corresponding ERA (for example: a settlement check
        # from a payer). If the payment is an ERA, then you should used the insurance-adjudications API.
        #
        # @param request [Hash] Request of type InsurancePayments::V1::InsurancePaymentCreate, as a Hash
        #   * :payer_identifier (Hash)
        #   * :amount_cents (Integer)
        #   * :payment_timestamp (DateTime)
        #   * :payment_note (String)
        #   * :allocations (Array<Financials::AllocationCreate>)
        # @param request_options [RequestOptions]
        # @return [InsurancePayments::V1::InsurancePayment]
        def create(request:, request_options: nil)
          response = @request_client.conn.post("/api/insurance-payments/v1") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          InsurancePayments::V1::InsurancePayment.from_json(json_object: response.body)
        end

        # Updates the patient payment record matching the provided insurance_payment_id. If updating the payment amount,
        # then the allocations must be appropriately updated as well.
        #
        # @param insurance_payment_id [InsurancePayments::V1::INSURANCE_PAYMENT_ID]
        # @param payment_timestamp [DateTime]
        # @param payment_note [Financials::NoteUpdate]
        # @param request_options [RequestOptions]
        # @return [InsurancePayments::V1::InsurancePayment]
        def update(insurance_payment_id:, payment_timestamp: nil, payment_note: nil, request_options: nil)
          response = @request_client.conn.patch("/api/insurance-payments/v1/#{insurance_payment_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              payment_timestamp: payment_timestamp,
              payment_note: payment_note
            }.compact
          end
          InsurancePayments::V1::InsurancePayment.from_json(json_object: response.body)
        end

        # Deletes the insurance payment record matching the provided `insurance_payment_id`.
        # If the matching record's organization_id does not match the authenticated user's
        # current organization_id, then a response code of `403` will be returned.
        #
        # @param insurance_payment_id [InsurancePayments::V1::INSURANCE_PAYMENT_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(insurance_payment_id:, request_options: nil)
          @request_client.conn.delete("/api/insurance-payments/v1/#{insurance_payment_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end
      end

      class AsyncV1Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [InsurancePayments::V1::AsyncV1Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Returns all non-ERA originated insurance payments satisfying the search criteria
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param payer_uuid [Payers::V3::PAYER_String]
        # @param claim_id [Commons::CLAIM_ID]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param billing_provider_id [Commons::PROVIDER_ID]
        # @param sort [InsurancePayments::V1::InsurancePaymentSortField] Defaults to payment_timestamp
        # @param sort_direction [Commons::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [Commons::PAGE_TOKEN]
        # @param request_options [RequestOptions]
        # @return [InsurancePayments::V1::InsurancePaymentsPage]
        def get_multi(limit: nil, payer_uuid: nil, claim_id: nil, service_line_id: nil, billing_provider_id: nil,
                      sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/insurance-payments/v1") do |req|
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
            InsurancePayments::V1::InsurancePaymentsPage.from_json(json_object: response.body)
          end
        end

        # Retrieves a previously created insurance payment by its `insurance_payment_id`.
        # If the payment does not exist, a `403` will be thrown.
        #
        # @param insurance_payment_id [InsurancePayments::V1::INSURANCE_PAYMENT_ID]
        # @param request_options [RequestOptions]
        # @return [InsurancePayments::V1::InsurancePayment]
        def get(insurance_payment_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/insurance-payments/v1/#{insurance_payment_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            InsurancePayments::V1::InsurancePayment.from_json(json_object: response.body)
          end
        end

        # Creates a new insurance payment record and returns the newly created `InsurancePayment` object. This endpoint
        # should only be used for insurance payments that do not have a corresponding ERA (for example: a settlement check
        # from a payer). If the payment is an ERA, then you should used the insurance-adjudications API.
        #
        # @param request [Hash] Request of type InsurancePayments::V1::InsurancePaymentCreate, as a Hash
        #   * :payer_identifier (Hash)
        #   * :amount_cents (Integer)
        #   * :payment_timestamp (DateTime)
        #   * :payment_note (String)
        #   * :allocations (Array<Financials::AllocationCreate>)
        # @param request_options [RequestOptions]
        # @return [InsurancePayments::V1::InsurancePayment]
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/insurance-payments/v1") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            InsurancePayments::V1::InsurancePayment.from_json(json_object: response.body)
          end
        end

        # Updates the patient payment record matching the provided insurance_payment_id. If updating the payment amount,
        # then the allocations must be appropriately updated as well.
        #
        # @param insurance_payment_id [InsurancePayments::V1::INSURANCE_PAYMENT_ID]
        # @param payment_timestamp [DateTime]
        # @param payment_note [Financials::NoteUpdate]
        # @param request_options [RequestOptions]
        # @return [InsurancePayments::V1::InsurancePayment]
        def update(insurance_payment_id:, payment_timestamp: nil, payment_note: nil, request_options: nil)
          Async do
            response = @request_client.conn.patch("/api/insurance-payments/v1/#{insurance_payment_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                payment_timestamp: payment_timestamp,
                payment_note: payment_note
              }.compact
            end
            InsurancePayments::V1::InsurancePayment.from_json(json_object: response.body)
          end
        end

        # Deletes the insurance payment record matching the provided `insurance_payment_id`.
        # If the matching record's organization_id does not match the authenticated user's
        # current organization_id, then a response code of `403` will be returned.
        #
        # @param insurance_payment_id [InsurancePayments::V1::INSURANCE_PAYMENT_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(insurance_payment_id:, request_options: nil)
          Async do
            @request_client.conn.delete("/api/insurance-payments/v1/#{insurance_payment_id}") do |req|
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
