# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/encounter_attachment"
require "json"
require_relative "types/encounter_attachment_type"
require_relative "../../../core/file_utilities"
require "async"

module CandidApiClient
  module EncounterAttachments
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::EncounterAttachments::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Array<CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachment>]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_attachments.v_1.get(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(encounter_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-attachments/v1/#{encounter_id}"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachment.from_json(json_object: item)
          end
        end

        # Uploads a file to the encounter. The file will be stored in the
        #  encounter's attachments. The maximum file size is 25MB.
        #
        # @param encounter_id [String]
        # @param attachment_file [String, IO]
        # @param attachment_type [CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachmentType]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [String]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_attachments.v_1.create(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", attachment_file: my_file.txt)
        def create(encounter_id:, attachment_file:, attachment_type:, request_options: nil)
          response = @request_client.conn.put do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              attachment_file: CandidApiClient::FileUtilities.as_faraday_multipart(file_like: attachment_file),
              attachment_type: attachment_type
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-attachments/v1/#{encounter_id}"
          end
          JSON.parse(response.body)
        end

        # @param encounter_id [String]
        # @param attachment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_attachments.v_1.delete(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", attachment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(encounter_id:, attachment_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), attachment_id: attachment_id }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-attachments/v1/#{encounter_id}"
          end
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::EncounterAttachments::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Array<CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachment>]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_attachments.v_1.get(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(encounter_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/encounter-attachments/v1/#{encounter_id}"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachment.from_json(json_object: item)
            end
          end
        end

        # Uploads a file to the encounter. The file will be stored in the
        #  encounter's attachments. The maximum file size is 25MB.
        #
        # @param encounter_id [String]
        # @param attachment_file [String, IO]
        # @param attachment_type [CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachmentType]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [String]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_attachments.v_1.create(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", attachment_file: my_file.txt)
        def create(encounter_id:, attachment_file:, attachment_type:, request_options: nil)
          Async do
            response = @request_client.conn.put do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                attachment_file: CandidApiClient::FileUtilities.as_faraday_multipart(file_like: attachment_file),
                attachment_type: attachment_type
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-attachments/v1/#{encounter_id}"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json
          end
        end

        # @param encounter_id [String]
        # @param attachment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_attachments.v_1.delete(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", attachment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(encounter_id:, attachment_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request_options&.additional_body_parameters || {}), attachment_id: attachment_id }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-attachments/v1/#{encounter_id}"
            end
          end
        end
      end
    end
  end
end
