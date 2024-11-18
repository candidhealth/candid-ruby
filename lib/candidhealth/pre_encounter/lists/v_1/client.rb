# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "../../common/types/sort_direction"
require_relative "types/patient_list_page"
require_relative "types/appointment_list_page"
require "async"

module CandidApiClient
  module PreEncounter
    module Lists
      module V1
        class V1Client
          # @return [CandidApiClient::RequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::Lists::V1::V1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Gets patients with dependent objects for patients that match the query
          #  parameters.
          #
          # @param page_token [String]
          # @param limit [Integer]
          # @param sort_field [String] Defaults to patient.updatedAt.
          # @param sort_direction [CandidApiClient::PreEncounter::Common::Types::SortDirection] Defaults to ascending.
          # @param filters [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Lists::V1::Types::PatientListPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.lists.v_1.get_patient_list(
          #    page_token: "string",
          #    limit: 1,
          #    sort_field: "string",
          #    sort_direction: ASC,
          #    filters: "string"
          #  )
          def get_patient_list(page_token: nil, limit: nil, sort_field: nil, sort_direction: nil, filters: nil,
                               request_options: nil)
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
                "page_token": page_token,
                "limit": limit,
                "sort_field": sort_field,
                "sort_direction": sort_direction,
                "filters": filters
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/lists/v1/patient"
            end
            CandidApiClient::PreEncounter::Lists::V1::Types::PatientListPage.from_json(json_object: response.body)
          end

          # Searches for appointments that match the query parameters.
          #
          # @param sort_field [String] Defaults to appointment.startTimestamp.
          # @param sort_direction [CandidApiClient::PreEncounter::Common::Types::SortDirection] Defaults to asc.
          # @param limit [Integer] Defaults to 100.
          # @param page_token [String]
          # @param filters [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Lists::V1::Types::AppointmentListPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.lists.v_1.get_appointment_list(
          #    sort_field: "string",
          #    sort_direction: ASC,
          #    limit: 1,
          #    page_token: "string",
          #    filters: "string"
          #  )
          def get_appointment_list(sort_field: nil, sort_direction: nil, limit: nil, page_token: nil, filters: nil,
                                   request_options: nil)
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
                "sort_field": sort_field,
                "sort_direction": sort_direction,
                "limit": limit,
                "page_token": page_token,
                "filters": filters
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/lists/v1/appointment"
            end
            CandidApiClient::PreEncounter::Lists::V1::Types::AppointmentListPage.from_json(json_object: response.body)
          end
        end

        class AsyncV1Client
          # @return [CandidApiClient::AsyncRequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::Lists::V1::AsyncV1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Gets patients with dependent objects for patients that match the query
          #  parameters.
          #
          # @param page_token [String]
          # @param limit [Integer]
          # @param sort_field [String] Defaults to patient.updatedAt.
          # @param sort_direction [CandidApiClient::PreEncounter::Common::Types::SortDirection] Defaults to ascending.
          # @param filters [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Lists::V1::Types::PatientListPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.lists.v_1.get_patient_list(
          #    page_token: "string",
          #    limit: 1,
          #    sort_field: "string",
          #    sort_direction: ASC,
          #    filters: "string"
          #  )
          def get_patient_list(page_token: nil, limit: nil, sort_field: nil, sort_direction: nil, filters: nil,
                               request_options: nil)
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
                  "page_token": page_token,
                  "limit": limit,
                  "sort_field": sort_field,
                  "sort_direction": sort_direction,
                  "filters": filters
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/lists/v1/patient"
              end
              CandidApiClient::PreEncounter::Lists::V1::Types::PatientListPage.from_json(json_object: response.body)
            end
          end

          # Searches for appointments that match the query parameters.
          #
          # @param sort_field [String] Defaults to appointment.startTimestamp.
          # @param sort_direction [CandidApiClient::PreEncounter::Common::Types::SortDirection] Defaults to asc.
          # @param limit [Integer] Defaults to 100.
          # @param page_token [String]
          # @param filters [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Lists::V1::Types::AppointmentListPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.lists.v_1.get_appointment_list(
          #    sort_field: "string",
          #    sort_direction: ASC,
          #    limit: 1,
          #    page_token: "string",
          #    filters: "string"
          #  )
          def get_appointment_list(sort_field: nil, sort_direction: nil, limit: nil, page_token: nil, filters: nil,
                                   request_options: nil)
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
                  "sort_field": sort_field,
                  "sort_direction": sort_direction,
                  "limit": limit,
                  "page_token": page_token,
                  "filters": filters
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/lists/v1/appointment"
              end
              CandidApiClient::PreEncounter::Lists::V1::Types::AppointmentListPage.from_json(json_object: response.body)
            end
          end
        end
      end
    end
  end
end
