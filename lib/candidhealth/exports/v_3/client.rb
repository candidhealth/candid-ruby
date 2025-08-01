# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/get_exports_response"
require "async"

module CandidApiClient
  module Exports
    module V3
      class V3Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::Exports::V3::V3Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # <Warning>
        #  API-based exports are in the process of being deprecated in favor of Candid Data
        #  Share and are not being offered to new customers.
        #  Please see the [Candid Data Share
        #  docs](https://docs.joincandidhealth.com/introduction/candid-data-share) for more
        #  information.
        #  </Warning>
        #  Retrieve CSV-formatted reports on claim submissions and outcomes. This endpoint
        #  returns Export objects that contain an
        #  authenticated URL to a customer's reports with a 2min TTL. The schema for the
        #  CSV export can be found
        #  [here](https://app.joincandidhealth.com/files/exports_schema.csv).
        #  **Schema changes:** Changing column order, removing columns, or changing the
        #  name of a column is considered a
        #  [Breaking Change](../../../api-principles/breaking-changes). Adding new columns
        #  to the end of the Exports file is not considered a
        #  Breaking Change and happens periodically. For this reason, it is important that
        #  any downstream automation or processes built on top
        #  of Candid Health's export files be resilient to the addition of new columns at
        #  the end of the file.
        #  **SLA guarantees:** Files for a given date are guaranteed to be available after
        #  3 business days. For example, Friday's file will be
        #  available by Wednesday at the latest. If file generation is still in progress
        #  upon request before 3 business days have passed, the
        #  caller will receive a 422 response. If the file has already been generated, it
        #  will be served. Historic files should be available
        #  up to 90 days in the past by default. Please email our [Support
        #  team](mailto:support@joincandidhealth.com) with any data requests
        #  outside of these stated guarantees.
        #
        # @param start_date [Date] Beginning date of claim versions returned in the export, ISO 8601 date e.g.
        #  2019-08-24.
        #  Must be at least 1 calendar day in the past. Cannot be earlier than 2022-10-07.
        # @param end_date [Date] Ending date of claim versions returned in the export, ISO 8601 date; e.g.
        #  2019-08-24.
        #  Must be within 30 days of start_date.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Exports::V3::Types::GetExportsResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.exports.v_3.get_exports(start_date: DateTime.parse(2023-10-01), end_date: DateTime.parse(2023-10-02))
        def get_exports(start_date:, end_date:, request_options: nil)
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
              "start_date": start_date,
              "end_date": end_date
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/exports/v3"
          end
          CandidApiClient::Exports::V3::Types::GetExportsResponse.from_json(json_object: response.body)
        end
      end

      class AsyncV3Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::Exports::V3::AsyncV3Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # <Warning>
        #  API-based exports are in the process of being deprecated in favor of Candid Data
        #  Share and are not being offered to new customers.
        #  Please see the [Candid Data Share
        #  docs](https://docs.joincandidhealth.com/introduction/candid-data-share) for more
        #  information.
        #  </Warning>
        #  Retrieve CSV-formatted reports on claim submissions and outcomes. This endpoint
        #  returns Export objects that contain an
        #  authenticated URL to a customer's reports with a 2min TTL. The schema for the
        #  CSV export can be found
        #  [here](https://app.joincandidhealth.com/files/exports_schema.csv).
        #  **Schema changes:** Changing column order, removing columns, or changing the
        #  name of a column is considered a
        #  [Breaking Change](../../../api-principles/breaking-changes). Adding new columns
        #  to the end of the Exports file is not considered a
        #  Breaking Change and happens periodically. For this reason, it is important that
        #  any downstream automation or processes built on top
        #  of Candid Health's export files be resilient to the addition of new columns at
        #  the end of the file.
        #  **SLA guarantees:** Files for a given date are guaranteed to be available after
        #  3 business days. For example, Friday's file will be
        #  available by Wednesday at the latest. If file generation is still in progress
        #  upon request before 3 business days have passed, the
        #  caller will receive a 422 response. If the file has already been generated, it
        #  will be served. Historic files should be available
        #  up to 90 days in the past by default. Please email our [Support
        #  team](mailto:support@joincandidhealth.com) with any data requests
        #  outside of these stated guarantees.
        #
        # @param start_date [Date] Beginning date of claim versions returned in the export, ISO 8601 date e.g.
        #  2019-08-24.
        #  Must be at least 1 calendar day in the past. Cannot be earlier than 2022-10-07.
        # @param end_date [Date] Ending date of claim versions returned in the export, ISO 8601 date; e.g.
        #  2019-08-24.
        #  Must be within 30 days of start_date.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Exports::V3::Types::GetExportsResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.exports.v_3.get_exports(start_date: DateTime.parse(2023-10-01), end_date: DateTime.parse(2023-10-02))
        def get_exports(start_date:, end_date:, request_options: nil)
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
                "start_date": start_date,
                "end_date": end_date
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/exports/v3"
            end
            CandidApiClient::Exports::V3::Types::GetExportsResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
