# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      class Client
        # @return [Candid::CustomSchemas::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all custom schemas.
        #
        # @return [Candid::CustomSchemas::V1::Types::SchemaGetMultiResponse]
        def get_multi(request_options: {}, **_params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/custom-schemas/v1"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::CustomSchemas::V1::Types::SchemaGetMultiResponse.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Return a custom schema with a given ID.
        #
        # @return [Candid::CustomSchemas::V1::Types::Schema]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/custom-schemas/v1/#{params[:schema_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::CustomSchemas::V1::Types::Schema.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Create custom schema with a set of typed keys. Schema keys can be referenced as inputs in user-configurable rules in the Rules
        # Engine, and key-value pairs can be attached to claims via the Encounters API.
        #
        # @return [Candid::CustomSchemas::V1::Types::Schema]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/custom-schemas/v1",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::CustomSchemas::V1::Types::Schema.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Update the name, description, or keys on a preexisting schema.
        #
        # @return [Candid::CustomSchemas::V1::Types::Schema]
        def update(request_options: {}, **params)
          _path_param_names = ["schema_id"]

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/custom-schemas/v1/#{params[:schema_id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::CustomSchemas::V1::Types::Schema.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
