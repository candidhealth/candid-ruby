# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/note"
require_relative "types/mutable_note"
require "async"

module CandidApiClient
  module PreEncounter
    module Notes
      module V1
        class V1Client
          # @return [CandidApiClient::RequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::Notes::V1::V1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Gets a note by NoteId.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Notes::V1::Types::Note]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.notes.v_1.get(id: "id")
          def get(id:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/notes/v1/#{id}"
            end
            CandidApiClient::PreEncounter::Notes::V1::Types::Note.from_json(json_object: response.body)
          end

          # Adds a new note.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Notes::V1::Types::MutableNote, as a Hash
          #   * :value (String)
          #   * :author_email (String)
          #   * :author_name (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Notes::V1::Types::Note]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.notes.v_1.create(request: { value: "value" })
          def create(request:, request_options: nil)
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter, request_options: request_options)}/notes/v1"
            end
            CandidApiClient::PreEncounter::Notes::V1::Types::Note.from_json(json_object: response.body)
          end

          # Updates a note. The path must contain the most recent version to prevent races.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Notes::V1::Types::MutableNote, as a Hash
          #   * :value (String)
          #   * :author_email (String)
          #   * :author_name (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Notes::V1::Types::Note]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.notes.v_1.update(
          #    id: "id",
          #    version: "version",
          #    request: { value: "value" }
          #  )
          def update(id:, version:, request:, request_options: nil)
            response = @request_client.conn.put do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/notes/v1/#{id}/#{version}"
            end
            CandidApiClient::PreEncounter::Notes::V1::Types::Note.from_json(json_object: response.body)
          end

          # Sets a note as deactivated.  The path must contain the most recent version to
          #  prevent races.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.notes.v_1.deactivate(id: "id", version: "version")
          def deactivate(id:, version:, request_options: nil)
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/notes/v1/#{id}/#{version}"
            end
          end
        end

        class AsyncV1Client
          # @return [CandidApiClient::AsyncRequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::Notes::V1::AsyncV1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Gets a note by NoteId.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Notes::V1::Types::Note]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.notes.v_1.get(id: "id")
          def get(id:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/notes/v1/#{id}"
              end
              CandidApiClient::PreEncounter::Notes::V1::Types::Note.from_json(json_object: response.body)
            end
          end

          # Adds a new note.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Notes::V1::Types::MutableNote, as a Hash
          #   * :value (String)
          #   * :author_email (String)
          #   * :author_name (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Notes::V1::Types::Note]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.notes.v_1.create(request: { value: "value" })
          def create(request:, request_options: nil)
            Async do
              response = @request_client.conn.post do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/notes/v1"
              end
              CandidApiClient::PreEncounter::Notes::V1::Types::Note.from_json(json_object: response.body)
            end
          end

          # Updates a note. The path must contain the most recent version to prevent races.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Notes::V1::Types::MutableNote, as a Hash
          #   * :value (String)
          #   * :author_email (String)
          #   * :author_name (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Notes::V1::Types::Note]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.notes.v_1.update(
          #    id: "id",
          #    version: "version",
          #    request: { value: "value" }
          #  )
          def update(id:, version:, request:, request_options: nil)
            Async do
              response = @request_client.conn.put do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/notes/v1/#{id}/#{version}"
              end
              CandidApiClient::PreEncounter::Notes::V1::Types::Note.from_json(json_object: response.body)
            end
          end

          # Sets a note as deactivated.  The path must contain the most recent version to
          #  prevent races.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.notes.v_1.deactivate(id: "id", version: "version")
          def deactivate(id:, version:, request_options: nil)
            Async do
              @request_client.conn.delete do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/notes/v1/#{id}/#{version}"
              end
            end
          end
        end
      end
    end
  end
end
