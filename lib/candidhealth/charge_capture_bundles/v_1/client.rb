# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/charge_capture_bundle"
require_relative "types/charge_capture_bundle_summary"
require_relative "types/charge_capture_bundle_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "types/charge_capture_bundle_status"
require_relative "../../charge_capture/v_1/types/charge_capture_status"
require "date"
require_relative "types/charge_capture_bundle_page"
require "async"

module CandidApiClient
  module ChargeCaptureBundles
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::ChargeCaptureBundles::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param charge_capture_bundle_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundle]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture_bundles.v_1.get(charge_capture_bundle_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(charge_capture_bundle_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/charge_capture_bundle/v1/#{charge_capture_bundle_id}"
          end
          CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundle.from_json(json_object: response.body)
        end

        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleSummary]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture_bundles.v_1.get_summary
        def get_summary(request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/charge_capture_bundle/v1/all/summary"
          end
          CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleSummary.from_json(json_object: response.body)
        end

        # @param charge_capture_bundle_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundle]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture_bundles.v_1.resubmit(charge_capture_bundle_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def resubmit(charge_capture_bundle_id:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/charge_capture_bundle/v1/#{charge_capture_bundle_id}"
          end
          CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundle.from_json(json_object: response.body)
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param sort [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleSortField] Defaults to created_at
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param bundle_status [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleStatus] the status of the charge capture bundle, refers to whether it was able to create
        #  an encounter.
        # @param charge_status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] the status of the charge captures
        # @param charge_external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        # @param has_charge_capture_updates [Boolean] If true, only return bundles that have charge captures that have been updated
        #  since the bundle has had a status of BILLED. See the updates property on
        #  ChargeCapture for more details.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundlePage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture_bundles.v_1.get_all(
        #    limit: 1,
        #    sort: CREATED_AT,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    patient_external_id: "string",
        #    bundle_status: NOT_STARTED,
        #    charge_status: PLANNED,
        #    charge_external_id: "string",
        #    date_of_service: DateTime.parse(2023-01-15),
        #    has_charge_capture_updates: true
        #  )
        def get_all(limit: nil, sort: nil, sort_direction: nil, page_token: nil, patient_external_id: nil,
                    bundle_status: nil, charge_status: nil, charge_external_id: nil, date_of_service: nil, has_charge_capture_updates: nil, request_options: nil)
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
              "limit": limit,
              "sort": sort,
              "sort_direction": sort_direction,
              "page_token": page_token,
              "patient_external_id": patient_external_id,
              "bundle_status": bundle_status,
              "charge_status": charge_status,
              "charge_external_id": charge_external_id,
              "date_of_service": date_of_service,
              "has_charge_capture_updates": has_charge_capture_updates
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/charge_capture_bundle/v1"
          end
          CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundlePage.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::ChargeCaptureBundles::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param charge_capture_bundle_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundle]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture_bundles.v_1.get(charge_capture_bundle_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(charge_capture_bundle_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/charge_capture_bundle/v1/#{charge_capture_bundle_id}"
            end
            CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundle.from_json(json_object: response.body)
          end
        end

        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleSummary]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture_bundles.v_1.get_summary
        def get_summary(request_options: nil)
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
                                                 request_options: request_options)}/api/charge_capture_bundle/v1/all/summary"
            end
            CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleSummary.from_json(json_object: response.body)
          end
        end

        # @param charge_capture_bundle_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundle]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture_bundles.v_1.resubmit(charge_capture_bundle_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def resubmit(charge_capture_bundle_id:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/charge_capture_bundle/v1/#{charge_capture_bundle_id}"
            end
            CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundle.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param sort [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleSortField] Defaults to created_at
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param bundle_status [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleStatus] the status of the charge capture bundle, refers to whether it was able to create
        #  an encounter.
        # @param charge_status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] the status of the charge captures
        # @param charge_external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        # @param has_charge_capture_updates [Boolean] If true, only return bundles that have charge captures that have been updated
        #  since the bundle has had a status of BILLED. See the updates property on
        #  ChargeCapture for more details.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundlePage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture_bundles.v_1.get_all(
        #    limit: 1,
        #    sort: CREATED_AT,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    patient_external_id: "string",
        #    bundle_status: NOT_STARTED,
        #    charge_status: PLANNED,
        #    charge_external_id: "string",
        #    date_of_service: DateTime.parse(2023-01-15),
        #    has_charge_capture_updates: true
        #  )
        def get_all(limit: nil, sort: nil, sort_direction: nil, page_token: nil, patient_external_id: nil,
                    bundle_status: nil, charge_status: nil, charge_external_id: nil, date_of_service: nil, has_charge_capture_updates: nil, request_options: nil)
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
                "limit": limit,
                "sort": sort,
                "sort_direction": sort_direction,
                "page_token": page_token,
                "patient_external_id": patient_external_id,
                "bundle_status": bundle_status,
                "charge_status": charge_status,
                "charge_external_id": charge_external_id,
                "date_of_service": date_of_service,
                "has_charge_capture_updates": has_charge_capture_updates
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/charge_capture_bundle/v1"
            end
            CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundlePage.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
