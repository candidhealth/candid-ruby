# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/mutable_image"
require_relative "types/image"
require "json"
require "async"

module CandidApiClient
  module PreEncounter
    module Images
      module V1
        class V1Client
          # @return [CandidApiClient::RequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::Images::V1::V1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Adds an image. VersionConflictError is returned if a front or back of this
          #  coverage already exists.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Images::V1::Types::MutableImage, as a Hash
          #   * :file_name (String)
          #   * :display_name (String)
          #   * :file_type (String)
          #   * :status (CandidApiClient::PreEncounter::Images::V1::Types::ImageStatus)
          #   * :coverage (Hash)
          #     * :id (String)
          #     * :side (CandidApiClient::PreEncounter::Images::V1::Types::CoverageImageSide)
          #   * :patient (Hash)
          #     * :id (String)
          #     * :notes (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Images::V1::Types::Image]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.images.v_1.create(request: { file_name: "string", display_name: "string", file_type: "string", status: PENDING, coverage: { id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", side: FRONT }, patient: { id: "string", notes: "string" } })
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
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/images/v1"
            end
            CandidApiClient::PreEncounter::Images::V1::Types::Image.from_json(json_object: response.body)
          end

          # Gets an image by imageId.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Images::V1::Types::Image]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.images.v_1.get(id: "string")
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
                                                 request_options: request_options)}/images/v1/#{id}"
            end
            CandidApiClient::PreEncounter::Images::V1::Types::Image.from_json(json_object: response.body)
          end

          # Updates an Image. The path must contain the most recent version to prevent
          #  races.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Images::V1::Types::MutableImage, as a Hash
          #   * :file_name (String)
          #   * :display_name (String)
          #   * :file_type (String)
          #   * :status (CandidApiClient::PreEncounter::Images::V1::Types::ImageStatus)
          #   * :coverage (Hash)
          #     * :id (String)
          #     * :side (CandidApiClient::PreEncounter::Images::V1::Types::CoverageImageSide)
          #   * :patient (Hash)
          #     * :id (String)
          #     * :notes (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Images::V1::Types::Image]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.images.v_1.update(
          #    id: "string",
          #    version: "string",
          #    request: { file_name: "string", display_name: "string", file_type: "string", status: PENDING, coverage: { id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", side: FRONT }, patient: { id: "string", notes: "string" } }
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
                                                 request_options: request_options)}/images/v1/#{id}/#{version}"
            end
            CandidApiClient::PreEncounter::Images::V1::Types::Image.from_json(json_object: response.body)
          end

          # Sets an Image as deactivated. The path must contain the most recent version to
          #  prevent races.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.images.v_1.deactivate(id: "string", version: "string")
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
                                                 request_options: request_options)}/images/v1/#{id}/#{version}"
            end
          end

          # Searches for images that match the query parameters.
          #
          # @param patient_id [String]
          # @param coverage_id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Images::V1::Types::Image>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.images.v_1.get_multi(patient_id: "string", coverage_id: "string")
          def get_multi(patient_id: nil, coverage_id: nil, request_options: nil)
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
                "patient_id": patient_id,
                "coverage_id": coverage_id
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/images/v1"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Images::V1::Types::Image.from_json(json_object: item)
            end
          end
        end

        class AsyncV1Client
          # @return [CandidApiClient::AsyncRequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::Images::V1::AsyncV1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Adds an image. VersionConflictError is returned if a front or back of this
          #  coverage already exists.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Images::V1::Types::MutableImage, as a Hash
          #   * :file_name (String)
          #   * :display_name (String)
          #   * :file_type (String)
          #   * :status (CandidApiClient::PreEncounter::Images::V1::Types::ImageStatus)
          #   * :coverage (Hash)
          #     * :id (String)
          #     * :side (CandidApiClient::PreEncounter::Images::V1::Types::CoverageImageSide)
          #   * :patient (Hash)
          #     * :id (String)
          #     * :notes (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Images::V1::Types::Image]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.images.v_1.create(request: { file_name: "string", display_name: "string", file_type: "string", status: PENDING, coverage: { id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", side: FRONT }, patient: { id: "string", notes: "string" } })
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
                                                   request_options: request_options)}/images/v1"
              end
              CandidApiClient::PreEncounter::Images::V1::Types::Image.from_json(json_object: response.body)
            end
          end

          # Gets an image by imageId.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Images::V1::Types::Image]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.images.v_1.get(id: "string")
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
                                                   request_options: request_options)}/images/v1/#{id}"
              end
              CandidApiClient::PreEncounter::Images::V1::Types::Image.from_json(json_object: response.body)
            end
          end

          # Updates an Image. The path must contain the most recent version to prevent
          #  races.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Images::V1::Types::MutableImage, as a Hash
          #   * :file_name (String)
          #   * :display_name (String)
          #   * :file_type (String)
          #   * :status (CandidApiClient::PreEncounter::Images::V1::Types::ImageStatus)
          #   * :coverage (Hash)
          #     * :id (String)
          #     * :side (CandidApiClient::PreEncounter::Images::V1::Types::CoverageImageSide)
          #   * :patient (Hash)
          #     * :id (String)
          #     * :notes (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Images::V1::Types::Image]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.images.v_1.update(
          #    id: "string",
          #    version: "string",
          #    request: { file_name: "string", display_name: "string", file_type: "string", status: PENDING, coverage: { id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", side: FRONT }, patient: { id: "string", notes: "string" } }
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
                                                   request_options: request_options)}/images/v1/#{id}/#{version}"
              end
              CandidApiClient::PreEncounter::Images::V1::Types::Image.from_json(json_object: response.body)
            end
          end

          # Sets an Image as deactivated. The path must contain the most recent version to
          #  prevent races.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.images.v_1.deactivate(id: "string", version: "string")
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
                                                   request_options: request_options)}/images/v1/#{id}/#{version}"
              end
            end
          end

          # Searches for images that match the query parameters.
          #
          # @param patient_id [String]
          # @param coverage_id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Images::V1::Types::Image>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.images.v_1.get_multi(patient_id: "string", coverage_id: "string")
          def get_multi(patient_id: nil, coverage_id: nil, request_options: nil)
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
                  "patient_id": patient_id,
                  "coverage_id": coverage_id
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/images/v1"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Images::V1::Types::Image.from_json(json_object: item)
              end
            end
          end
        end
      end
    end
  end
end
