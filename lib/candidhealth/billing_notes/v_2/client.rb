# frozen_string_literal: true

require_relative "../../../requests"
require "ostruct"
require_relative "types/billing_note"
require "async"

module CandidApiClient
  module BillingNotes
    module V2
      class V2Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::BillingNotes::V2::V2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param text [String] Empty string not allowed.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param _field_set [Object]
        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::BillingNotes::V2::Types::BillingNote]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.billing_notes.v_2.create(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def create(text:, encounter_id:, additional_properties: nil, _field_set: nil, request_options: nil)
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
              text: text,
              additional_properties: additional_properties,
              _field_set: _field_set,
              encounter_id: encounter_id
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/billing_notes/v2"
          end
          CandidApiClient::BillingNotes::V2::Types::BillingNote.from_json(json_object: response.body)
        end

        # @param billing_note_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.billing_notes.v_2.delete(billing_note_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(billing_note_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/billing_notes/v2/#{billing_note_id}"
          end
        end

        # @param billing_note_id [String]
        # @param text [String] Empty string not allowed.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::BillingNotes::V2::Types::BillingNote]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.billing_notes.v_2.update(billing_note_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", text: "string")
        def update(billing_note_id:, text:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), text: text }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/billing_notes/v2/#{billing_note_id}"
          end
          CandidApiClient::BillingNotes::V2::Types::BillingNote.from_json(json_object: response.body)
        end
      end

      class AsyncV2Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::BillingNotes::V2::AsyncV2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param text [String] Empty string not allowed.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param _field_set [Object]
        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::BillingNotes::V2::Types::BillingNote]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.billing_notes.v_2.create(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def create(text:, encounter_id:, additional_properties: nil, _field_set: nil, request_options: nil)
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
                text: text,
                additional_properties: additional_properties,
                _field_set: _field_set,
                encounter_id: encounter_id
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/billing_notes/v2"
            end
            CandidApiClient::BillingNotes::V2::Types::BillingNote.from_json(json_object: response.body)
          end
        end

        # @param billing_note_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.billing_notes.v_2.delete(billing_note_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(billing_note_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/billing_notes/v2/#{billing_note_id}"
            end
          end
        end

        # @param billing_note_id [String]
        # @param text [String] Empty string not allowed.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::BillingNotes::V2::Types::BillingNote]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.billing_notes.v_2.update(billing_note_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", text: "string")
        def update(billing_note_id:, text:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request_options&.additional_body_parameters || {}), text: text }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/billing_notes/v2/#{billing_note_id}"
            end
            CandidApiClient::BillingNotes::V2::Types::BillingNote.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
