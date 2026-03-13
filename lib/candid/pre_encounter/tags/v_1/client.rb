# frozen_string_literal: true

module Candid
  module PreEncounter
    module Tags
      module V1
        class Client
          # @param client [Candid::Internal::Http::RawClient]
          # @param base_url [String, nil]
          # @param environment [Hash[Symbol, String], nil]
          #
          # @return [void]
          def initialize(client:, base_url: nil, environment: nil)
            @client = client
            @base_url = base_url
            @environment = environment
          end

          # Gets a tag by TagId.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::TagId] :id
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::Tag]
          def get(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/tags/v1/#{params[:id]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Tags::V1::Types::Tag.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Gets all tags. Defaults to page size of 1000.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Integer, nil] :limit
          # @option params [String, nil] :page_token
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::TagPage]
          def get_all(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[limit page_token]
            query_params = {}
            query_params["limit"] = params[:limit] if params.key?(:limit)
            query_params["page_token"] = params[:page_token] if params.key?(:page_token)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/tags/v1",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Tags::V1::Types::TagPage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Adds a new tag if it does not already exist, otherwise, returns the existing tag.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Tags::V1::Types::MutableTag]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::Tag]
          def create(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/tags/v1",
              body: Candid::PreEncounter::Tags::V1::Types::MutableTag.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Tags::V1::Types::Tag.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Updates a tag. The path must contain the most recent version to prevent races.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Tags::V1::Types::MutableTag]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::TagId] :id
          # @option params [String] :version
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::Tag]
          def update(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "PUT",
              path: "/tags/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Tags::V1::Types::MutableTag.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Tags::V1::Types::Tag.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Sets a tag as deactivated.  The path must contain the most recent version to prevent races.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::TagId] :id
          # @option params [String] :version
          #
          # @return [untyped]
          def deactivate(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "DELETE",
              path: "/tags/v1/#{params[:id]}/#{params[:version]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
