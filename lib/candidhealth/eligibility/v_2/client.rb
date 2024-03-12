# frozen_string_literal: true

require_relative "../../../requests"
require "async"

module CandidApiClient
  module Eligibility
    module V2
      class V2Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [Eligibility::V2::V2Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # This API is a wrapper around Change Healthcare's eligibility API. Below are some helpful documentation links:
        #
        # - [Change Healthcare - Guides: Contents of the Eligibility Request Body](https://developers.changehealthcare.com/eligibilityandclaims/docs/contents-of-the-eligibility-request-body)
        # - [Change Healthcare - Guides: Use "Bare Minimum" Eligibility Requests](https://developers.changehealthcare.com/eligibilityandclaims/docs/use-bare-minimum-eligibility-requests)
        # - [Change Healthcare - Guides: Contents of the Eligibility Response](https://developers.changehealthcare.com/eligibilityandclaims/docs/contents-of-the-eligibility-response)
        # - [Change Healthcare - Guides: Eligibility JSON-to-EDI API Contents](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-json-to-edi-api-contents)
        # - [Change Healthcare - Guides: Eligibility Error Messages](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-error-messages)
        # - [Change Healthcare - Guides: FAQ](https://developers.changehealthcare.com/eligibilityandclaims/docs/frequently-asked-questions)
        # - [Change Healthcare - Guides: Eligibility FAQs](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-api-requests)
        # - [Change Healthcare - Guides: Sandbox API Values and Test Responses](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-sandbox-api-values-and-test-responses)
        # - [Change Healthcare - Guides: Sandbox Predefined Fields and Values](https://developers.changehealthcare.com/eligibilityandclaims/docs/sandbox-predefined-fields-and-values)
        # - [Change Healthcare - Guides: Using Test Payers in the Sandbox](https://developers.changehealthcare.com/eligibilityandclaims/docs/use-the-test-payers-in-the-sandbox-api)
        #
        # A schema of the response object can be found here: [Change Healthcare Docs](https://developers.changehealthcare.com/eligibilityandclaims/reference/medicaleligibility)
        #
        # @param request [Object]
        # @param request_options [RequestOptions]
        # @return [Object]
        def submit_eligibility_check(request: nil, request_options: nil)
          response = @request_client.conn.post("/api/eligibility/v2") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          response.body
        end

        # If you'd like access to this endpoint, please reach out to support@joincandidhealth.com with the subject line "Action: Activate Availity Eligibility API Endpoint
        #
        # This API is a wrapper around Availity's coverages API. Below are some helpful documentation links:
        #
        # - [Availity - Coverages 1.0.0 API](https://developer.availity.com/partner/documentation#c_coverages_references)
        # - [Candid Availity Eligibility Integration Guide](https://support.joincandidhealth.com/hc/en-us/articles/24218441631892--Availity-Eligibility-Integration-Guide)
        #
        # A schema of the response object can be found here: [Availity Docs](https://developer.availity.com/partner/product/191210/api/190898#/Coverages_100/operation/%2Fcoverages/get)
        #
        # - Note Availity requires a free developer account to access this documentation.
        #
        # @param request_options [RequestOptions]
        # @return [Object]
        def submit_eligibility_check_availity(request_options: nil)
          response = @request_client.conn.get("/api/eligibility/v2/availity") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          response.body
        end
      end

      class AsyncV2Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [Eligibility::V2::AsyncV2Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # This API is a wrapper around Change Healthcare's eligibility API. Below are some helpful documentation links:
        #
        # - [Change Healthcare - Guides: Contents of the Eligibility Request Body](https://developers.changehealthcare.com/eligibilityandclaims/docs/contents-of-the-eligibility-request-body)
        # - [Change Healthcare - Guides: Use "Bare Minimum" Eligibility Requests](https://developers.changehealthcare.com/eligibilityandclaims/docs/use-bare-minimum-eligibility-requests)
        # - [Change Healthcare - Guides: Contents of the Eligibility Response](https://developers.changehealthcare.com/eligibilityandclaims/docs/contents-of-the-eligibility-response)
        # - [Change Healthcare - Guides: Eligibility JSON-to-EDI API Contents](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-json-to-edi-api-contents)
        # - [Change Healthcare - Guides: Eligibility Error Messages](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-error-messages)
        # - [Change Healthcare - Guides: FAQ](https://developers.changehealthcare.com/eligibilityandclaims/docs/frequently-asked-questions)
        # - [Change Healthcare - Guides: Eligibility FAQs](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-api-requests)
        # - [Change Healthcare - Guides: Sandbox API Values and Test Responses](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-sandbox-api-values-and-test-responses)
        # - [Change Healthcare - Guides: Sandbox Predefined Fields and Values](https://developers.changehealthcare.com/eligibilityandclaims/docs/sandbox-predefined-fields-and-values)
        # - [Change Healthcare - Guides: Using Test Payers in the Sandbox](https://developers.changehealthcare.com/eligibilityandclaims/docs/use-the-test-payers-in-the-sandbox-api)
        #
        # A schema of the response object can be found here: [Change Healthcare Docs](https://developers.changehealthcare.com/eligibilityandclaims/reference/medicaleligibility)
        #
        # @param request [Object]
        # @param request_options [RequestOptions]
        # @return [Object]
        def submit_eligibility_check(request: nil, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/eligibility/v2") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            response.body
          end
        end

        # If you'd like access to this endpoint, please reach out to support@joincandidhealth.com with the subject line "Action: Activate Availity Eligibility API Endpoint
        #
        # This API is a wrapper around Availity's coverages API. Below are some helpful documentation links:
        #
        # - [Availity - Coverages 1.0.0 API](https://developer.availity.com/partner/documentation#c_coverages_references)
        # - [Candid Availity Eligibility Integration Guide](https://support.joincandidhealth.com/hc/en-us/articles/24218441631892--Availity-Eligibility-Integration-Guide)
        #
        # A schema of the response object can be found here: [Availity Docs](https://developer.availity.com/partner/product/191210/api/190898#/Coverages_100/operation/%2Fcoverages/get)
        #
        # - Note Availity requires a free developer account to access this documentation.
        #
        # @param request_options [RequestOptions]
        # @return [Object]
        def submit_eligibility_check_availity(request_options: nil)
          Async do
            response = @request_client.conn.get("/api/eligibility/v2/availity") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            response.body
          end
        end
      end
    end
  end
end
