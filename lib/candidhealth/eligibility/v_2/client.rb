# frozen_string_literal: true

require_relative "../../../requests"
require "json"
require "async"

module CandidApiClient
  module Eligibility
    module V2
      class V2Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::Eligibility::V2::V2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # <Tip>Candid is deprecating support for this endpoint. It is instead recommended
        #  to use [Candid's Stedi passthrough
        #  t](https://docs.joincandidhealth.com/api-reference/eligibility-checks/v-1/post).
        #  For assistance with the transition, please reference the [Transitioning to
        #  Candid's New Eligibility
        #  Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980)
        #  document in the Candid Support Center.</Tip>
        #  This API is a wrapper around Change Healthcare's eligibility API. Below are some
        #  helpful documentation links:
        #  - [Change Healthcare - Guides: Contents of the Eligibility Request
        #  althcare.com/eligibilityandclaims/docs/contents-of-the-eligibility-request-body)
        #  - [Change Healthcare - Guides: Use "Bare Minimum" Eligibility
        #  ehealthcare.com/eligibilityandclaims/docs/use-bare-minimum-eligibility-requests)
        #  - [Change Healthcare - Guides: Contents of the Eligibility
        #  gehealthcare.com/eligibilityandclaims/docs/contents-of-the-eligibility-response)
        #  - [Change Healthcare - Guides: Eligibility JSON-to-EDI API
        #  gehealthcare.com/eligibilityandclaims/docs/eligibility-json-to-edi-api-contents)
        #  - [Change Healthcare - Guides: Eligibility Error
        #  opers.changehealthcare.com/eligibilityandclaims/docs/eligibility-error-messages)
        #  - [Change Healthcare - Guides:
        #  opers.changehealthcare.com/eligibilityandclaims/docs/frequently-asked-questions)
        #  - [Change Healthcare - Guides: Eligibility
        #  elopers.changehealthcare.com/eligibilityandclaims/docs/eligibility-api-requests)
        #  - [Change Healthcare - Guides: Sandbox API Values and Test
        #  com/eligibilityandclaims/docs/eligibility-sandbox-api-values-and-test-responses)
        #  - [Change Healthcare - Guides: Sandbox Predefined Fields and
        #  gehealthcare.com/eligibilityandclaims/docs/sandbox-predefined-fields-and-values)
        #  - [Change Healthcare - Guides: Using Test Payers in the
        #  healthcare.com/eligibilityandclaims/docs/use-the-test-payers-in-the-sandbox-api)
        #  A schema of the response object can be found here: [Change Healthcare
        #  velopers.changehealthcare.com/eligibilityandclaims/reference/medicaleligibility)
        #
        # @param request [Object]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Object]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.eligibility.v_2.submit_eligibility_check(request: {"key":"value"})
        def submit_eligibility_check(request: nil, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/eligibility/v2"
          end
          JSON.parse(response.body)
        end

        # <Tip>Candid is deprecating support for this endpoint. It is instead recommended
        #  to use [Candid's Stedi passthrough
        #  t](https://docs.joincandidhealth.com/api-reference/eligibility-checks/v-1/post).
        #  For assistance with the transition, please reference the [Transitioning to
        #  Candid's New Eligibility
        #  Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980)
        #  document in the Candid Support Center.</Tip>
        #  **Availity has transitioned their GET endpoint to a POST endpoint. Candid has
        #  updated their pass-through integration to enable backwards compatibility for the
        #  GET endpoint so that customers do not have to immediately update their
        #  integrations.**
        #  **Candid recommends integrations with the [POST
        #  health.com/api-reference/eligibility/v-2/submit-eligibility-check-availity-post)
        #  to ensure the best possible integration experience. Given the transition,
        #  Availity’s documentation will be out of sync with this endpoint.**
        #  If you'd like access to this endpoint, please reach out to
        #  support@joincandidhealth.com with the subject line "Action: Activate Availity
        #  Eligibility API Endpoint
        #  This API is a wrapper around Availity's coverages API. Below are some helpful
        #  documentation links:
        #  - [Availity - Coverages 1.0.0
        #  PI](https://developer.availity.com/partner/documentation#c_coverages_references)
        #  - [Candid Availity Eligibility Integration
        #  th.com/hc/en-us/articles/24218441631892--Availity-Eligibility-Integration-Guide)
        #  A schema of the response object can be found here: [Availity
        #  tner/product/191210/api/190898#/Coverages_100/operation/%2Fcoverages%2F{id}/get)
        #  - Note Availity requires a free developer account to access this documentation.
        #  Check connection status of Availity API and partners here:
        #  - [Availity Trading Partner Connection Status](https://www.availity.com/status/)
        #
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Object]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.eligibility.v_2.submit_eligibility_check_availity
        def submit_eligibility_check_availity(request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/eligibility/v2/availity"
          end
          JSON.parse(response.body)
        end

        # <Tip>Candid is deprecating support for this endpoint. It is instead recommended
        #  to use [Candid's Stedi passthrough
        #  t](https://docs.joincandidhealth.com/api-reference/eligibility-checks/v-1/post).
        #  For assistance with the transition, please reference the [Transitioning to
        #  Candid's New Eligibility
        #  Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980)
        #  document in the Candid Support Center.</Tip>
        #  If you'd like access to this endpoint, please reach out to
        #  support@joincandidhealth.com with the subject line "Action: Activate Availity
        #  Eligibility API Endpoint
        #  This API is a wrapper around Availity's coverages API. Below are some helpful
        #  documentation links:
        #  - [Availity - Coverages 1.0.0
        #  PI](https://developer.availity.com/partner/documentation#c_coverages_references)
        #  - [Candid Availity Eligibility Integration
        #  th.com/hc/en-us/articles/24218441631892--Availity-Eligibility-Integration-Guide)
        #  A schema of the response object can be found here: [Availity
        #  tner/product/191210/api/190898#/Coverages_100/operation/%2Fcoverages%2F{id}/get)
        #  - Note Availity requires a free developer account to access this documentation.
        #  Check connection status of Availity API and partners here:
        #  - [Availity Trading Partner Connection Status](https://www.availity.com/status/)
        #
        # @param request [Object]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Object]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.eligibility.v_2.submit_eligibility_check_availity_post(request: {"key":"value"})
        def submit_eligibility_check_availity_post(request: nil, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/eligibility/v2/availity"
          end
          JSON.parse(response.body)
        end
      end

      class AsyncV2Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::Eligibility::V2::AsyncV2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # <Tip>Candid is deprecating support for this endpoint. It is instead recommended
        #  to use [Candid's Stedi passthrough
        #  t](https://docs.joincandidhealth.com/api-reference/eligibility-checks/v-1/post).
        #  For assistance with the transition, please reference the [Transitioning to
        #  Candid's New Eligibility
        #  Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980)
        #  document in the Candid Support Center.</Tip>
        #  This API is a wrapper around Change Healthcare's eligibility API. Below are some
        #  helpful documentation links:
        #  - [Change Healthcare - Guides: Contents of the Eligibility Request
        #  althcare.com/eligibilityandclaims/docs/contents-of-the-eligibility-request-body)
        #  - [Change Healthcare - Guides: Use "Bare Minimum" Eligibility
        #  ehealthcare.com/eligibilityandclaims/docs/use-bare-minimum-eligibility-requests)
        #  - [Change Healthcare - Guides: Contents of the Eligibility
        #  gehealthcare.com/eligibilityandclaims/docs/contents-of-the-eligibility-response)
        #  - [Change Healthcare - Guides: Eligibility JSON-to-EDI API
        #  gehealthcare.com/eligibilityandclaims/docs/eligibility-json-to-edi-api-contents)
        #  - [Change Healthcare - Guides: Eligibility Error
        #  opers.changehealthcare.com/eligibilityandclaims/docs/eligibility-error-messages)
        #  - [Change Healthcare - Guides:
        #  opers.changehealthcare.com/eligibilityandclaims/docs/frequently-asked-questions)
        #  - [Change Healthcare - Guides: Eligibility
        #  elopers.changehealthcare.com/eligibilityandclaims/docs/eligibility-api-requests)
        #  - [Change Healthcare - Guides: Sandbox API Values and Test
        #  com/eligibilityandclaims/docs/eligibility-sandbox-api-values-and-test-responses)
        #  - [Change Healthcare - Guides: Sandbox Predefined Fields and
        #  gehealthcare.com/eligibilityandclaims/docs/sandbox-predefined-fields-and-values)
        #  - [Change Healthcare - Guides: Using Test Payers in the
        #  healthcare.com/eligibilityandclaims/docs/use-the-test-payers-in-the-sandbox-api)
        #  A schema of the response object can be found here: [Change Healthcare
        #  velopers.changehealthcare.com/eligibilityandclaims/reference/medicaleligibility)
        #
        # @param request [Object]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Object]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.eligibility.v_2.submit_eligibility_check(request: {"key":"value"})
        def submit_eligibility_check(request: nil, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/eligibility/v2"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json
          end
        end

        # <Tip>Candid is deprecating support for this endpoint. It is instead recommended
        #  to use [Candid's Stedi passthrough
        #  t](https://docs.joincandidhealth.com/api-reference/eligibility-checks/v-1/post).
        #  For assistance with the transition, please reference the [Transitioning to
        #  Candid's New Eligibility
        #  Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980)
        #  document in the Candid Support Center.</Tip>
        #  **Availity has transitioned their GET endpoint to a POST endpoint. Candid has
        #  updated their pass-through integration to enable backwards compatibility for the
        #  GET endpoint so that customers do not have to immediately update their
        #  integrations.**
        #  **Candid recommends integrations with the [POST
        #  health.com/api-reference/eligibility/v-2/submit-eligibility-check-availity-post)
        #  to ensure the best possible integration experience. Given the transition,
        #  Availity’s documentation will be out of sync with this endpoint.**
        #  If you'd like access to this endpoint, please reach out to
        #  support@joincandidhealth.com with the subject line "Action: Activate Availity
        #  Eligibility API Endpoint
        #  This API is a wrapper around Availity's coverages API. Below are some helpful
        #  documentation links:
        #  - [Availity - Coverages 1.0.0
        #  PI](https://developer.availity.com/partner/documentation#c_coverages_references)
        #  - [Candid Availity Eligibility Integration
        #  th.com/hc/en-us/articles/24218441631892--Availity-Eligibility-Integration-Guide)
        #  A schema of the response object can be found here: [Availity
        #  tner/product/191210/api/190898#/Coverages_100/operation/%2Fcoverages%2F{id}/get)
        #  - Note Availity requires a free developer account to access this documentation.
        #  Check connection status of Availity API and partners here:
        #  - [Availity Trading Partner Connection Status](https://www.availity.com/status/)
        #
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Object]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.eligibility.v_2.submit_eligibility_check_availity
        def submit_eligibility_check_availity(request_options: nil)
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
                                                 request_options: request_options)}/api/eligibility/v2/availity"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json
          end
        end

        # <Tip>Candid is deprecating support for this endpoint. It is instead recommended
        #  to use [Candid's Stedi passthrough
        #  t](https://docs.joincandidhealth.com/api-reference/eligibility-checks/v-1/post).
        #  For assistance with the transition, please reference the [Transitioning to
        #  Candid's New Eligibility
        #  Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980)
        #  document in the Candid Support Center.</Tip>
        #  If you'd like access to this endpoint, please reach out to
        #  support@joincandidhealth.com with the subject line "Action: Activate Availity
        #  Eligibility API Endpoint
        #  This API is a wrapper around Availity's coverages API. Below are some helpful
        #  documentation links:
        #  - [Availity - Coverages 1.0.0
        #  PI](https://developer.availity.com/partner/documentation#c_coverages_references)
        #  - [Candid Availity Eligibility Integration
        #  th.com/hc/en-us/articles/24218441631892--Availity-Eligibility-Integration-Guide)
        #  A schema of the response object can be found here: [Availity
        #  tner/product/191210/api/190898#/Coverages_100/operation/%2Fcoverages%2F{id}/get)
        #  - Note Availity requires a free developer account to access this documentation.
        #  Check connection status of Availity API and partners here:
        #  - [Availity Trading Partner Connection Status](https://www.availity.com/status/)
        #
        # @param request [Object]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Object]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.eligibility.v_2.submit_eligibility_check_availity_post(request: {"key":"value"})
        def submit_eligibility_check_availity_post(request: nil, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/eligibility/v2/availity"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json
          end
        end
      end
    end
  end
end
