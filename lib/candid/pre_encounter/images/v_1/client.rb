# frozen_string_literal: true

module Candid
  module PreEncounter
    module Images
      module V1
        class Client
          # @return [Candid::PreEncounter::Images::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Adds an image.  VersionConflictError is returned if a front or back of this coverage already exists.
          #
          # @return [Candid::PreEncounter::Images::V1::Types::Image]
          def create(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/images/v1",
              body: Candid::PreEncounter::Images::V1::Types::MutableImage.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Images::V1::Types::Image.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Gets an image by imageId.
          #
          # @return [Candid::PreEncounter::Images::V1::Types::Image]
          def get(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/images/v1/#{params[:id]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Images::V1::Types::Image.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Updates an Image.  The path must contain the most recent version to prevent races.
          #
          # @return [Candid::PreEncounter::Images::V1::Types::Image]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "PUT",
              path: "/images/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Images::V1::Types::MutableImage.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Images::V1::Types::Image.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Sets an Image as deactivated.  The path must contain the most recent version to prevent races.
          #
          # @return [untyped]
          def deactivate(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "DELETE",
              path: "/images/v1/#{params[:id]}/#{params[:version]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end

          # Searches for images that match the query parameters.
          #
          # @return [Array[Candid::PreEncounter::Images::V1::Types::Image]]
          def get_multi(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[patient_id coverage_id]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/images/v1",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
