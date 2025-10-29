# frozen_string_literal: true

module Candid
  module PreEncounter
    module Tags
      module V1
        class Client
          # @return [Candid::PreEncounter::Tags::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Gets a tag by TagId.
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::Tag]
          def get(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/tags/v1/#{params[:id]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Tags::V1::Types::Tag.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Gets all tags. Defaults to page size of 1000.
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::TagPage]
          def get_all(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[limit page_token]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/tags/v1",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Tags::V1::Types::TagPage.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Adds a new tag if it does not already exist, otherwise, returns the existing tag.
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::Tag]
          def create(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/tags/v1",
              body: Candid::PreEncounter::Tags::V1::Types::MutableTag.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Tags::V1::Types::Tag.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Updates a tag. The path must contain the most recent version to prevent races.
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::Tag]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "PUT",
              path: "/tags/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Tags::V1::Types::MutableTag.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Tags::V1::Types::Tag.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Sets a tag as deactivated.  The path must contain the most recent version to prevent races.
          #
          # @return [untyped]
          def deactivate(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "DELETE",
              path: "/tags/v1/#{params[:id]}/#{params[:version]}"
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
