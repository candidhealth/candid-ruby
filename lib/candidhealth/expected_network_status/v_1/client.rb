# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../commons/types/insurance_type_code"
require_relative "../../commons/types/state"
require_relative "types/expected_network_status_response"
require "async"

module CandidApiClient
  module ExpectedNetworkStatus
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::ExpectedNetworkStatus::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Computes the expected network status given the provided information.
        #
        # @param external_patient_id [String]
        # @param subscriber_payer_id [String]
        # @param subscriber_payer_name [String]
        # @param subscriber_insurance_type [CandidApiClient::Commons::Types::InsuranceTypeCode]
        # @param subscriber_plan_name [String] The descriptive name of the insurance plan selected by the subscriber, often
        #  indicating coverage specifics or tier.
        # @param billing_provider_npi [String] The National Provider Identifier (NPI) of the healthcare provider responsible
        #  for billing. A unique 10-digit identification number.
        # @param billing_provider_tin [String] Follow the 9-digit format of the Taxpayer Identification Number (TIN).
        # @param rendering_provider_npi [String] The National Provider Identifier (NPI) of the healthcare provider who delivered
        #  the services. A unique 10-digit identification number.
        # @param contracted_state [CandidApiClient::Commons::Types::State] The state in which the healthcare provider has a contractual agreement with the
        #  insurance payer.
        # @param date_of_service [String] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatusResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.expected_network_status.v_1.compute(
        #    subscriber_payer_id: "subscriber_payer_id",
        #    subscriber_payer_name: "subscriber_payer_name",
        #    billing_provider_npi: "billing_provider_npi",
        #    billing_provider_tin: "billing_provider_tin",
        #    rendering_provider_npi: "rendering_provider_npi",
        #    contracted_state: AA,
        #    date_of_service: "date_of_service"
        #  )
        def compute(subscriber_payer_id:, subscriber_payer_name:, billing_provider_npi:, billing_provider_tin:, rendering_provider_npi:, contracted_state:, date_of_service:, external_patient_id: nil,
                    subscriber_insurance_type: nil, subscriber_plan_name: nil, request_options: nil)
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
              external_patient_id: external_patient_id,
              subscriber_payer_id: subscriber_payer_id,
              subscriber_payer_name: subscriber_payer_name,
              subscriber_insurance_type: subscriber_insurance_type,
              subscriber_plan_name: subscriber_plan_name,
              billing_provider_npi: billing_provider_npi,
              billing_provider_tin: billing_provider_tin,
              rendering_provider_npi: rendering_provider_npi,
              contracted_state: contracted_state,
              date_of_service: date_of_service
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/expected-network-status/v1"
          end
          CandidApiClient::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatusResponse.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::ExpectedNetworkStatus::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Computes the expected network status given the provided information.
        #
        # @param external_patient_id [String]
        # @param subscriber_payer_id [String]
        # @param subscriber_payer_name [String]
        # @param subscriber_insurance_type [CandidApiClient::Commons::Types::InsuranceTypeCode]
        # @param subscriber_plan_name [String] The descriptive name of the insurance plan selected by the subscriber, often
        #  indicating coverage specifics or tier.
        # @param billing_provider_npi [String] The National Provider Identifier (NPI) of the healthcare provider responsible
        #  for billing. A unique 10-digit identification number.
        # @param billing_provider_tin [String] Follow the 9-digit format of the Taxpayer Identification Number (TIN).
        # @param rendering_provider_npi [String] The National Provider Identifier (NPI) of the healthcare provider who delivered
        #  the services. A unique 10-digit identification number.
        # @param contracted_state [CandidApiClient::Commons::Types::State] The state in which the healthcare provider has a contractual agreement with the
        #  insurance payer.
        # @param date_of_service [String] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatusResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.expected_network_status.v_1.compute(
        #    subscriber_payer_id: "subscriber_payer_id",
        #    subscriber_payer_name: "subscriber_payer_name",
        #    billing_provider_npi: "billing_provider_npi",
        #    billing_provider_tin: "billing_provider_tin",
        #    rendering_provider_npi: "rendering_provider_npi",
        #    contracted_state: AA,
        #    date_of_service: "date_of_service"
        #  )
        def compute(subscriber_payer_id:, subscriber_payer_name:, billing_provider_npi:, billing_provider_tin:, rendering_provider_npi:, contracted_state:, date_of_service:, external_patient_id: nil,
                    subscriber_insurance_type: nil, subscriber_plan_name: nil, request_options: nil)
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
                external_patient_id: external_patient_id,
                subscriber_payer_id: subscriber_payer_id,
                subscriber_payer_name: subscriber_payer_name,
                subscriber_insurance_type: subscriber_insurance_type,
                subscriber_plan_name: subscriber_plan_name,
                billing_provider_npi: billing_provider_npi,
                billing_provider_tin: billing_provider_tin,
                rendering_provider_npi: rendering_provider_npi,
                contracted_state: contracted_state,
                date_of_service: date_of_service
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/expected-network-status/v1"
            end
            CandidApiClient::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatusResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
