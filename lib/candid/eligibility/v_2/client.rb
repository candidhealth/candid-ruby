# frozen_string_literal: true

module Candid
  module Eligibility
    module V2
      class Client
        # @return [Candid::Eligibility::V2::Client]
        def initialize(client:)
          @client = client
        end

        # <Tip>Candid is deprecating support for this endpoint. It is instead recommended to use [Candid's Stedi passthrough endpoint](https://docs.joincandidhealth.com/api-reference/pre-encounter/eligibility-checks/v-1/post).
        # For assistance with the transition, please reference the [Transitioning to Candid's New Eligibility Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980) document in the Candid Support Center.</Tip>
        #
        # **Availity has transitioned their GET endpoint to a POST endpoint. Candid has updated their pass-through integration to enable backwards compatibility for the GET endpoint so that customers do not have to immediately update their integrations.**
        #
        # **Candid recommends integrations with the [POST endpoint](https://docs.joincandidhealth.com/api-reference/eligibility/v-2/submit-eligibility-check-availity-post) to ensure the best possible integration experience. Given the transition, Availity’s documentation will be out of sync with this endpoint.**
        #
        # If you'd like access to this endpoint, please reach out to support@joincandidhealth.com with the subject line "Action: Activate Availity Eligibility API Endpoint
        #
        # This API is a wrapper around Availity's coverages API. Below are some helpful documentation links:
        #
        # - [Availity - Coverages 1.0.0 API](https://developer.availity.com/partner/documentation#c_coverages_references)
        # - [Candid Availity Eligibility Integration Guide](https://support.joincandidhealth.com/hc/en-us/articles/24218441631892--Availity-Eligibility-Integration-Guide)
        #
        # A schema of the response object can be found here: [Availity Docs](https://developer.availity.com/partner/product/191210/api/190898#/Coverages_100/operation/%2Fcoverages%2F{id}/get)
        # * Note Availity requires a free developer account to access this documentation.
        #
        # Check connection status of Availity API and partners here:
        # - [Availity Trading Partner Connection Status](https://www.availity.com/status/)
        #
        # @return [Hash[String, Object]]
        def submit_eligibility_check_availity(request_options: {}, **_params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/eligibility/v2/availity"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end

        # <Tip>Candid is deprecating support for this endpoint. It is instead recommended to use [Candid's Stedi passthrough endpoint](https://docs.joincandidhealth.com/api-reference/pre-encounter/eligibility-checks/v-1/post).
        # For assistance with the transition, please reference the [Transitioning to Candid's New Eligibility Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980) document in the Candid Support Center.</Tip>
        #
        # If you'd like access to this endpoint, please reach out to support@joincandidhealth.com with the subject line "Action: Activate Availity Eligibility API Endpoint
        #
        # This API is a wrapper around Availity's coverages API. Below are some helpful documentation links:
        #
        # - [Availity - Coverages 1.0.0 API](https://developer.availity.com/partner/documentation#c_coverages_references)
        # - [Candid Availity Eligibility Integration Guide](https://support.joincandidhealth.com/hc/en-us/articles/24218441631892--Availity-Eligibility-Integration-Guide)
        #
        # A schema of the response object can be found here: [Availity Docs](https://developer.availity.com/partner/product/191210/api/190898#/Coverages_100/operation/%2Fcoverages%2F{id}/get)
        # * Note Availity requires a free developer account to access this documentation.
        #
        # Check connection status of Availity API and partners here:
        # - [Availity Trading Partner Connection Status](https://www.availity.com/status/)
        #
        # @return [Hash[String, Object]]
        def submit_eligibility_check_availity_post(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/eligibility/v2/availity",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
