# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../commons/types/encounter_id"
require_relative "types/billing_note"
require "async"

module CandidApiClient
  module BillingNotes
    module V2
      class V2Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [BillingNotes::V2::V2Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # @param text [String] Empty string not allowed.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param request_options [RequestOptions]
        # @return [BillingNotes::V2::BillingNote]
        def create(text:, encounter_id:, additional_properties: nil, request_options: nil)
          response = @request_client.conn.post("/api/billing_notes/v2") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              text: text,
              additional_properties: additional_properties,
              encounter_id: encounter_id
            }.compact
          end
          BillingNotes::V2::BillingNote.from_json(json_object: response.body)
        end
      end

      class AsyncV2Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [BillingNotes::V2::AsyncV2Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # @param text [String] Empty string not allowed.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param request_options [RequestOptions]
        # @return [BillingNotes::V2::BillingNote]
        def create(text:, encounter_id:, additional_properties: nil, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/billing_notes/v2") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                text: text,
                additional_properties: additional_properties,
                encounter_id: encounter_id
              }.compact
            end
            BillingNotes::V2::BillingNote.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
