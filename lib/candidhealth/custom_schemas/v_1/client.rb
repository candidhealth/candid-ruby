# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/schema_get_multi_response"
require_relative "types/schema"
require_relative "types/schema_field"
require "async"

module CandidApiClient
  module CustomSchemas
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::CustomSchemas::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all custom schemas.
        #
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::CustomSchemas::V1::Types::SchemaGetMultiResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.custom_schemas.v_1.get_multi
        def get_multi(request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/custom-schemas/v1"
          end
          CandidApiClient::CustomSchemas::V1::Types::SchemaGetMultiResponse.from_json(json_object: response.body)
        end

        # Return a custom schema with a given ID.
        #
        # @param schema_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::CustomSchemas::V1::Types::Schema]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.custom_schemas.v_1.get(schema_id: "ec096b13-f80a-471d-aaeb-54b021c9d582")
        def get(schema_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/custom-schemas/v1/#{schema_id}"
          end
          CandidApiClient::CustomSchemas::V1::Types::Schema.from_json(json_object: response.body)
        end

        # Create custom schema with a set of typed keys. Schema keys can be referenced as
        #  inputs in user-configurable rules in the Rules
        #  Engine, and key-value pairs can be attached to claims via the Encounters API.
        #
        # @param name [String]
        # @param description [String]
        # @param fields [Array<Hash>] Request of type Array<CandidApiClient::CustomSchemas::V1::Types::SchemaField>, as a Hash
        #   * :key (String)
        #   * :type (CandidApiClient::Commons::Types::Primitive)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::CustomSchemas::V1::Types::Schema]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.custom_schemas.v_1.create(
        #    name: "General Medicine",
        #    description: "Values associated with a generic visit",
        #    fields: [{ key: "provider_category", type: STRING }, { key: "is_urgent_care", type: BOOLEAN }, { key: "bmi", type: DOUBLE }, { key: "age", type: INTEGER }]
        #  )
        def create(name:, fields:, description: nil, request_options: nil)
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
              name: name,
              description: description,
              fields: fields
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/custom-schemas/v1"
          end
          CandidApiClient::CustomSchemas::V1::Types::Schema.from_json(json_object: response.body)
        end

        # Update the name, description, or keys on a preexisting schema.
        #
        # @param schema_id [String]
        # @param name [String]
        # @param description [String]
        # @param fields_to_add [Array<Hash>] A list of typed entries to add to schema. Only additive modifications are
        #  permitted.Request of type Array<CandidApiClient::CustomSchemas::V1::Types::SchemaField>, as a Hash
        #   * :key (String)
        #   * :type (CandidApiClient::Commons::Types::Primitive)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::CustomSchemas::V1::Types::Schema]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.custom_schemas.v_1.update(
        #    schema_id: "ec096b13-f80a-471d-aaeb-54b021c9d582",
        #    name: "General Medicine and Health",
        #    description: "Values collected during all visits",
        #    fields_to_add: [{ key: "visit_type", type: STRING }]
        #  )
        def update(schema_id:, name: nil, description: nil, fields_to_add: nil, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              name: name,
              description: description,
              fields_to_add: fields_to_add
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/custom-schemas/v1/#{schema_id}"
          end
          CandidApiClient::CustomSchemas::V1::Types::Schema.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::CustomSchemas::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all custom schemas.
        #
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::CustomSchemas::V1::Types::SchemaGetMultiResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.custom_schemas.v_1.get_multi
        def get_multi(request_options: nil)
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
                                                 request_options: request_options)}/api/custom-schemas/v1"
            end
            CandidApiClient::CustomSchemas::V1::Types::SchemaGetMultiResponse.from_json(json_object: response.body)
          end
        end

        # Return a custom schema with a given ID.
        #
        # @param schema_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::CustomSchemas::V1::Types::Schema]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.custom_schemas.v_1.get(schema_id: "ec096b13-f80a-471d-aaeb-54b021c9d582")
        def get(schema_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/custom-schemas/v1/#{schema_id}"
            end
            CandidApiClient::CustomSchemas::V1::Types::Schema.from_json(json_object: response.body)
          end
        end

        # Create custom schema with a set of typed keys. Schema keys can be referenced as
        #  inputs in user-configurable rules in the Rules
        #  Engine, and key-value pairs can be attached to claims via the Encounters API.
        #
        # @param name [String]
        # @param description [String]
        # @param fields [Array<Hash>] Request of type Array<CandidApiClient::CustomSchemas::V1::Types::SchemaField>, as a Hash
        #   * :key (String)
        #   * :type (CandidApiClient::Commons::Types::Primitive)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::CustomSchemas::V1::Types::Schema]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.custom_schemas.v_1.create(
        #    name: "General Medicine",
        #    description: "Values associated with a generic visit",
        #    fields: [{ key: "provider_category", type: STRING }, { key: "is_urgent_care", type: BOOLEAN }, { key: "bmi", type: DOUBLE }, { key: "age", type: INTEGER }]
        #  )
        def create(name:, fields:, description: nil, request_options: nil)
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
                name: name,
                description: description,
                fields: fields
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/custom-schemas/v1"
            end
            CandidApiClient::CustomSchemas::V1::Types::Schema.from_json(json_object: response.body)
          end
        end

        # Update the name, description, or keys on a preexisting schema.
        #
        # @param schema_id [String]
        # @param name [String]
        # @param description [String]
        # @param fields_to_add [Array<Hash>] A list of typed entries to add to schema. Only additive modifications are
        #  permitted.Request of type Array<CandidApiClient::CustomSchemas::V1::Types::SchemaField>, as a Hash
        #   * :key (String)
        #   * :type (CandidApiClient::Commons::Types::Primitive)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::CustomSchemas::V1::Types::Schema]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.custom_schemas.v_1.update(
        #    schema_id: "ec096b13-f80a-471d-aaeb-54b021c9d582",
        #    name: "General Medicine and Health",
        #    description: "Values collected during all visits",
        #    fields_to_add: [{ key: "visit_type", type: STRING }]
        #  )
        def update(schema_id:, name: nil, description: nil, fields_to_add: nil, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                name: name,
                description: description,
                fields_to_add: fields_to_add
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/custom-schemas/v1/#{schema_id}"
            end
            CandidApiClient::CustomSchemas::V1::Types::Schema.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
