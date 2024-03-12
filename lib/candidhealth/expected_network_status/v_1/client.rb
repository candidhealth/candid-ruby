# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../commons/types/insurance_type_code"
require_relative "../../commons/types/state"
require_relative "../../commons/types/date"
require_relative "types/expected_network_status_response"
require "async"

module CandidApiClient
  module ExpectedNetworkStatus
    module V1
      class V1Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [ExpectedNetworkStatus::V1::V1Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Computes the expected network status given the provided information.
        #
        # @param external_patient_id [String]
        # @param subscriber_payer_id [String]
        # @param subscriber_payer_name [String]
        # @param subscriber_insurance_type [Commons::InsuranceTypeCode]
        # @param subscriber_plan_name [String] The descriptive name of the insurance plan selected by the subscriber, often indicating coverage specifics or tier.
        # @param billing_provider_npi [String] The National Provider Identifier (NPI) of the healthcare provider responsible for billing. A unique 10-digit identification number.
        # @param billing_provider_tin [String] Follow the 9-digit format of the Taxpayer Identification Number (TIN).
        # @param rendering_provider_npi [String] The National Provider Identifier (NPI) of the healthcare provider who delivered the services. A unique 10-digit identification number.
        # @param contracted_state [Commons::State] The state in which the healthcare provider has a contractual agreement with the insurance payer.
        # @param date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param request_options [RequestOptions]
        # @return [ExpectedNetworkStatus::V1::ExpectedNetworkStatusResponse]
        def compute(subscriber_payer_id:, subscriber_payer_name:, billing_provider_npi:, billing_provider_tin:, rendering_provider_npi:, contracted_state:, date_of_service:, external_patient_id: nil,
                    subscriber_insurance_type: nil, subscriber_plan_name: nil, request_options: nil)
          response = @request_client.conn.post("/api/expected-network-status/v1") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
          end
          ExpectedNetworkStatus::V1::ExpectedNetworkStatusResponse.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [ExpectedNetworkStatus::V1::AsyncV1Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Computes the expected network status given the provided information.
        #
        # @param external_patient_id [String]
        # @param subscriber_payer_id [String]
        # @param subscriber_payer_name [String]
        # @param subscriber_insurance_type [Commons::InsuranceTypeCode]
        # @param subscriber_plan_name [String] The descriptive name of the insurance plan selected by the subscriber, often indicating coverage specifics or tier.
        # @param billing_provider_npi [String] The National Provider Identifier (NPI) of the healthcare provider responsible for billing. A unique 10-digit identification number.
        # @param billing_provider_tin [String] Follow the 9-digit format of the Taxpayer Identification Number (TIN).
        # @param rendering_provider_npi [String] The National Provider Identifier (NPI) of the healthcare provider who delivered the services. A unique 10-digit identification number.
        # @param contracted_state [Commons::State] The state in which the healthcare provider has a contractual agreement with the insurance payer.
        # @param date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param request_options [RequestOptions]
        # @return [ExpectedNetworkStatus::V1::ExpectedNetworkStatusResponse]
        def compute(subscriber_payer_id:, subscriber_payer_name:, billing_provider_npi:, billing_provider_tin:, rendering_provider_npi:, contracted_state:, date_of_service:, external_patient_id: nil,
                    subscriber_insurance_type: nil, subscriber_plan_name: nil, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/expected-network-status/v1") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
            end
            ExpectedNetworkStatus::V1::ExpectedNetworkStatusResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
