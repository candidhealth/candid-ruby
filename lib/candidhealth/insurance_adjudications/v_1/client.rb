# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/insurance_adjudication_id"
require_relative "types/insurance_adjudication"
require_relative "types/insurance_adjudication_create"
require "async"

module CandidApiClient
  module InsuranceAdjudications
    module V1
      class V1Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [InsuranceAdjudications::V1::V1Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Retrieves a previously created insurance adjudication by its `insurance_adjudication_id`.
        #
        # @param insurance_adjudication_id [InsuranceAdjudications::V1::INSURANCE_ADJUDICATION_ID]
        # @param request_options [RequestOptions]
        # @return [InsuranceAdjudications::V1::InsuranceAdjudication]
        def get(insurance_adjudication_id:, request_options: nil)
          response = @request_client.conn.get("/api/insurance-adjudications/v1/#{insurance_adjudication_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          InsuranceAdjudications::V1::InsuranceAdjudication.from_json(json_object: response.body)
        end

        # Creates a new insurance adjudication record and returns the newly created InsuranceAdjudication object.
        #
        # @param request [Hash] Request of type InsuranceAdjudications::V1::InsuranceAdjudicationCreate, as a Hash
        #   * :payer_identifier (Hash)
        #   * :payee (Hash)
        #     * :payee_name (String)
        #     * :payee_identifier (Hash)
        #   * :post_date (Date)
        #   * :check_number (String)
        #   * :check_date (Date)
        #   * :note (String)
        #   * :claims (Hash{Commons::CLAIM_ID => Array})
        # @param request_options [RequestOptions]
        # @return [InsuranceAdjudications::V1::InsuranceAdjudication]
        def create(request:, request_options: nil)
          response = @request_client.conn.post("/api/insurance-adjudications/v1") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          InsuranceAdjudications::V1::InsuranceAdjudication.from_json(json_object: response.body)
        end

        # Deletes the insurance adjudication record matching the provided insurance_adjudication_id.
        #
        # @param insurance_adjudication_id [InsuranceAdjudications::V1::INSURANCE_ADJUDICATION_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(insurance_adjudication_id:, request_options: nil)
          @request_client.conn.delete("/api/insurance-adjudications/v1/#{insurance_adjudication_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end
      end

      class AsyncV1Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [InsuranceAdjudications::V1::AsyncV1Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Retrieves a previously created insurance adjudication by its `insurance_adjudication_id`.
        #
        # @param insurance_adjudication_id [InsuranceAdjudications::V1::INSURANCE_ADJUDICATION_ID]
        # @param request_options [RequestOptions]
        # @return [InsuranceAdjudications::V1::InsuranceAdjudication]
        def get(insurance_adjudication_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/insurance-adjudications/v1/#{insurance_adjudication_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            InsuranceAdjudications::V1::InsuranceAdjudication.from_json(json_object: response.body)
          end
        end

        # Creates a new insurance adjudication record and returns the newly created InsuranceAdjudication object.
        #
        # @param request [Hash] Request of type InsuranceAdjudications::V1::InsuranceAdjudicationCreate, as a Hash
        #   * :payer_identifier (Hash)
        #   * :payee (Hash)
        #     * :payee_name (String)
        #     * :payee_identifier (Hash)
        #   * :post_date (Date)
        #   * :check_number (String)
        #   * :check_date (Date)
        #   * :note (String)
        #   * :claims (Hash{Commons::CLAIM_ID => Array})
        # @param request_options [RequestOptions]
        # @return [InsuranceAdjudications::V1::InsuranceAdjudication]
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/insurance-adjudications/v1") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            InsuranceAdjudications::V1::InsuranceAdjudication.from_json(json_object: response.body)
          end
        end

        # Deletes the insurance adjudication record matching the provided insurance_adjudication_id.
        #
        # @param insurance_adjudication_id [InsuranceAdjudications::V1::INSURANCE_ADJUDICATION_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(insurance_adjudication_id:, request_options: nil)
          Async do
            @request_client.conn.delete("/api/insurance-adjudications/v1/#{insurance_adjudication_id}") do |req|
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
