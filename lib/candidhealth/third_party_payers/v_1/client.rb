# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/create_third_party_payer_request"
require_relative "types/third_party_payer"
require_relative "types/toggle_third_party_payer_enablement_request"
require_relative "types/third_party_payer_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "types/third_party_payer_page"
require_relative "types/third_party_payer_update_request"
require "async"

module CandidApiClient
  module ThirdPartyPayers
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::ThirdPartyPayers::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param request [Hash] Request of type CandidApiClient::ThirdPartyPayers::V1::Types::CreateThirdPartyPayerRequest, as a Hash
        #   * :name (String)
        #   * :description (String)
        #   * :category (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.create(request: { name: "string", description: "string", category: "string" })
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
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payers/v1"
          end
          CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer.from_json(json_object: response.body)
        end

        # @param third_party_payer_id [String]
        # @param request [Hash] Request of type CandidApiClient::ThirdPartyPayers::V1::Types::ToggleThirdPartyPayerEnablementRequest, as a Hash
        #   * :enabled (Boolean)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.toggle_enablement(third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { enabled: true })
        def toggle_enablement(third_party_payer_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payers/v1/#{third_party_payer_id}/toggle_enablement"
          end
          CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer.from_json(json_object: response.body)
        end

        # @param name [String]
        # @param category [String]
        # @param enabled [Boolean]
        # @param sort [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerSortField]
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection]
        # @param limit [Integer] Defaults to 100
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.get_multi(
        #    name: "string",
        #    category: "string",
        #    enabled: true,
        #    sort: NAME,
        #    sort_direction: ASC,
        #    limit: 1,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(name: nil, category: nil, enabled: nil, sort: nil, sort_direction: nil, limit: nil,
                      page_token: nil, request_options: nil)
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
              "name": name,
              "category": category,
              "enabled": enabled,
              "sort": sort,
              "sort_direction": sort_direction,
              "limit": limit,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payers/v1"
          end
          CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerPage.from_json(json_object: response.body)
        end

        # @param third_party_payer_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.get(third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(third_party_payer_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payers/v1/#{third_party_payer_id}"
          end
          CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer.from_json(json_object: response.body)
        end

        # @param third_party_payer_id [String]
        # @param request [Hash] Request of type CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerUpdateRequest, as a Hash
        #   * :name (String)
        #   * :description (Hash)
        #   * :category (Hash)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.update(third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { name: "string" })
        def update(third_party_payer_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payers/v1/#{third_party_payer_id}"
          end
          CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer.from_json(json_object: response.body)
        end

        # @param third_party_payer_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.delete(third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(third_party_payer_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payers/v1/#{third_party_payer_id}"
          end
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::ThirdPartyPayers::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param request [Hash] Request of type CandidApiClient::ThirdPartyPayers::V1::Types::CreateThirdPartyPayerRequest, as a Hash
        #   * :name (String)
        #   * :description (String)
        #   * :category (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.create(request: { name: "string", description: "string", category: "string" })
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
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/third-party-payers/v1"
            end
            CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer.from_json(json_object: response.body)
          end
        end

        # @param third_party_payer_id [String]
        # @param request [Hash] Request of type CandidApiClient::ThirdPartyPayers::V1::Types::ToggleThirdPartyPayerEnablementRequest, as a Hash
        #   * :enabled (Boolean)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.toggle_enablement(third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { enabled: true })
        def toggle_enablement(third_party_payer_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/third-party-payers/v1/#{third_party_payer_id}/toggle_enablement"
            end
            CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer.from_json(json_object: response.body)
          end
        end

        # @param name [String]
        # @param category [String]
        # @param enabled [Boolean]
        # @param sort [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerSortField]
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection]
        # @param limit [Integer] Defaults to 100
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.get_multi(
        #    name: "string",
        #    category: "string",
        #    enabled: true,
        #    sort: NAME,
        #    sort_direction: ASC,
        #    limit: 1,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(name: nil, category: nil, enabled: nil, sort: nil, sort_direction: nil, limit: nil,
                      page_token: nil, request_options: nil)
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
                "name": name,
                "category": category,
                "enabled": enabled,
                "sort": sort,
                "sort_direction": sort_direction,
                "limit": limit,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/third-party-payers/v1"
            end
            CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerPage.from_json(json_object: response.body)
          end
        end

        # @param third_party_payer_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.get(third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(third_party_payer_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/third-party-payers/v1/#{third_party_payer_id}"
            end
            CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer.from_json(json_object: response.body)
          end
        end

        # @param third_party_payer_id [String]
        # @param request [Hash] Request of type CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerUpdateRequest, as a Hash
        #   * :name (String)
        #   * :description (Hash)
        #   * :category (Hash)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.update(third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { name: "string" })
        def update(third_party_payer_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/third-party-payers/v1/#{third_party_payer_id}"
            end
            CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer.from_json(json_object: response.body)
          end
        end

        # @param third_party_payer_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payers.v_1.delete(third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(third_party_payer_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/third-party-payers/v1/#{third_party_payer_id}"
            end
          end
        end
      end
    end
  end
end
