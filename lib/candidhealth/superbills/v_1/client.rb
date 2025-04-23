# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "../../commons/types/street_address_short_zip"
require_relative "types/superbill_response"
require "async"

module CandidApiClient
  module Superbills
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::Superbills::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param patient_external_id [String] Empty string not allowed
        # @param date_range_min [Date] Minimum (inclusive) date selected for the superbill
        # @param date_range_max [Date] Maximum (inclusive) date selected for the superbill
        # @param pay_to_address [Hash] Address that will be displayed on the superbill as the 'Pay to' Address. If not
        #  provided this value will be set from available encounter data.Request of type CandidApiClient::Commons::Types::StreetAddressShortZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (CandidApiClient::Commons::Types::State)
        #   * :zip_code (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Superbills::V1::Types::SuperbillResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.superbills.v_1.create_superbill(
        #    patient_external_id: "string",
        #    date_range_min: DateTime.parse(2023-01-15),
        #    date_range_max: DateTime.parse(2023-01-15),
        #    pay_to_address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }
        #  )
        def create_superbill(patient_external_id:, date_range_min:, date_range_max:, pay_to_address: nil,
                             request_options: nil)
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
              patient_external_id: patient_external_id,
              date_range_min: date_range_min,
              date_range_max: date_range_max,
              pay_to_address: pay_to_address
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/superbill/v1"
          end
          CandidApiClient::Superbills::V1::Types::SuperbillResponse.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::Superbills::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param patient_external_id [String] Empty string not allowed
        # @param date_range_min [Date] Minimum (inclusive) date selected for the superbill
        # @param date_range_max [Date] Maximum (inclusive) date selected for the superbill
        # @param pay_to_address [Hash] Address that will be displayed on the superbill as the 'Pay to' Address. If not
        #  provided this value will be set from available encounter data.Request of type CandidApiClient::Commons::Types::StreetAddressShortZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (CandidApiClient::Commons::Types::State)
        #   * :zip_code (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Superbills::V1::Types::SuperbillResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.superbills.v_1.create_superbill(
        #    patient_external_id: "string",
        #    date_range_min: DateTime.parse(2023-01-15),
        #    date_range_max: DateTime.parse(2023-01-15),
        #    pay_to_address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }
        #  )
        def create_superbill(patient_external_id:, date_range_min:, date_range_max:, pay_to_address: nil,
                             request_options: nil)
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
                patient_external_id: patient_external_id,
                date_range_min: date_range_min,
                date_range_max: date_range_max,
                pay_to_address: pay_to_address
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/superbill/v1"
            end
            CandidApiClient::Superbills::V1::Types::SuperbillResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
