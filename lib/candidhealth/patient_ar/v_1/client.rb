# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/list_inventory_paged_response"
require_relative "types/invoice_itemization_response"
require "async"

module CandidApiClient
  module PatientAr
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::PatientAr::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # NOTE: This service is in-development and can only be used by select partners.
        #  Please contact Candid Health to request access.
        #  Retrieve a list of inventory records based on the provided filters. Each
        #  inventory record provides the latest invoiceable status of the associated claim.
        #  The response is paginated, and the `page_token` can be used to retrieve
        #  subsequent pages. Initial requests should not include `page_token`.
        #
        # @param since [DateTime] Timestamp to filter records since, inclusive
        # @param limit [Integer] Maximum number of records to return, default is 100
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientAr::V1::Types::ListInventoryPagedResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_ar.v_1.list_inventory
        def list_inventory(since: nil, limit: nil, page_token: nil, request_options: nil)
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
              "since": since,
              "limit": limit,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/patient-ar/v1/inventory"
          end
          CandidApiClient::PatientAr::V1::Types::ListInventoryPagedResponse.from_json(json_object: response.body)
        end

        # NOTE: This service is in-development and can only be used by select partners.
        #  Please contact Candid Health to request access.
        #  Provides detailed itemization of invoice data for a specific claim.
        #
        # @param claim_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientAr::V1::Types::InvoiceItemizationResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_ar.v_1.itemize(claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def itemize(claim_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/patient-ar/v1/invoice-itemization/#{claim_id}"
          end
          CandidApiClient::PatientAr::V1::Types::InvoiceItemizationResponse.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::PatientAr::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # NOTE: This service is in-development and can only be used by select partners.
        #  Please contact Candid Health to request access.
        #  Retrieve a list of inventory records based on the provided filters. Each
        #  inventory record provides the latest invoiceable status of the associated claim.
        #  The response is paginated, and the `page_token` can be used to retrieve
        #  subsequent pages. Initial requests should not include `page_token`.
        #
        # @param since [DateTime] Timestamp to filter records since, inclusive
        # @param limit [Integer] Maximum number of records to return, default is 100
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientAr::V1::Types::ListInventoryPagedResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_ar.v_1.list_inventory
        def list_inventory(since: nil, limit: nil, page_token: nil, request_options: nil)
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
                "since": since,
                "limit": limit,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/patient-ar/v1/inventory"
            end
            CandidApiClient::PatientAr::V1::Types::ListInventoryPagedResponse.from_json(json_object: response.body)
          end
        end

        # NOTE: This service is in-development and can only be used by select partners.
        #  Please contact Candid Health to request access.
        #  Provides detailed itemization of invoice data for a specific claim.
        #
        # @param claim_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientAr::V1::Types::InvoiceItemizationResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_ar.v_1.itemize(claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def itemize(claim_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/patient-ar/v1/invoice-itemization/#{claim_id}"
            end
            CandidApiClient::PatientAr::V1::Types::InvoiceItemizationResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
