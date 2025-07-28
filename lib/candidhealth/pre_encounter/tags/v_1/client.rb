# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/tag"
require_relative "types/tag_page"
require_relative "types/mutable_tag"
require "async"

module CandidApiClient
  module PreEncounter
    module Tags
      module V1
        class V1Client
          # @return [CandidApiClient::RequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::Tags::V1::V1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Gets a tag by TagId.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Tags::V1::Types::Tag]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.tags.v_1.get(id: "id")
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
                                                 request_options: request_options)}/tags/v1/#{id}"
            end
            CandidApiClient::PreEncounter::Tags::V1::Types::Tag.from_json(json_object: response.body)
          end

          # Gets all tags. Defaults to page size of 1000.
          #
          # @param limit [Integer]
          # @param page_token [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Tags::V1::Types::TagPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.tags.v_1.get_all
          def get_all(limit: nil, page_token: nil, request_options: nil)
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
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter, request_options: request_options)}/tags/v1"
            end
            CandidApiClient::PreEncounter::Tags::V1::Types::TagPage.from_json(json_object: response.body)
          end

          # Adds a new tag if it does not already exist, otherwise, returns the existing
          #  tag.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Tags::V1::Types::MutableTag, as a Hash
          #   * :value (String)
          #   * :description (String)
          #   * :alert (Boolean)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Tags::V1::Types::Tag]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.tags.v_1.create(request: { value: "value" })
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
              req.url "#{@request_client.get_url(environment: PreEncounter, request_options: request_options)}/tags/v1"
            end
            CandidApiClient::PreEncounter::Tags::V1::Types::Tag.from_json(json_object: response.body)
          end

          # Updates a tag. The path must contain the most recent version to prevent races.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Tags::V1::Types::MutableTag, as a Hash
          #   * :value (String)
          #   * :description (String)
          #   * :alert (Boolean)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Tags::V1::Types::Tag]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.tags.v_1.update(
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
                                                 request_options: request_options)}/tags/v1/#{id}/#{version}"
            end
            CandidApiClient::PreEncounter::Tags::V1::Types::Tag.from_json(json_object: response.body)
          end

          # Sets a tag as deactivated.  The path must contain the most recent version to
          #  prevent races.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.tags.v_1.deactivate(id: "id", version: "version")
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
                                                 request_options: request_options)}/tags/v1/#{id}/#{version}"
            end
          end
        end

        class AsyncV1Client
          # @return [CandidApiClient::AsyncRequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::Tags::V1::AsyncV1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Gets a tag by TagId.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Tags::V1::Types::Tag]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.tags.v_1.get(id: "id")
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
                                                   request_options: request_options)}/tags/v1/#{id}"
              end
              CandidApiClient::PreEncounter::Tags::V1::Types::Tag.from_json(json_object: response.body)
            end
          end

          # Gets all tags. Defaults to page size of 1000.
          #
          # @param limit [Integer]
          # @param page_token [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Tags::V1::Types::TagPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.tags.v_1.get_all
          def get_all(limit: nil, page_token: nil, request_options: nil)
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
                  "page_token": page_token
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/tags/v1"
              end
              CandidApiClient::PreEncounter::Tags::V1::Types::TagPage.from_json(json_object: response.body)
            end
          end

          # Adds a new tag if it does not already exist, otherwise, returns the existing
          #  tag.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Tags::V1::Types::MutableTag, as a Hash
          #   * :value (String)
          #   * :description (String)
          #   * :alert (Boolean)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Tags::V1::Types::Tag]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.tags.v_1.create(request: { value: "value" })
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
                                                   request_options: request_options)}/tags/v1"
              end
              CandidApiClient::PreEncounter::Tags::V1::Types::Tag.from_json(json_object: response.body)
            end
          end

          # Updates a tag. The path must contain the most recent version to prevent races.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Tags::V1::Types::MutableTag, as a Hash
          #   * :value (String)
          #   * :description (String)
          #   * :alert (Boolean)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Tags::V1::Types::Tag]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.tags.v_1.update(
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
                                                   request_options: request_options)}/tags/v1/#{id}/#{version}"
              end
              CandidApiClient::PreEncounter::Tags::V1::Types::Tag.from_json(json_object: response.body)
            end
          end

          # Sets a tag as deactivated.  The path must contain the most recent version to
          #  prevent races.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.tags.v_1.deactivate(id: "id", version: "version")
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
                                                   request_options: request_options)}/tags/v1/#{id}/#{version}"
              end
            end
          end
        end
      end
    end
  end
end
