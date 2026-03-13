# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
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

        # @param request_options [Hash]
        # @param params [Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::EncounterId] :encounter_id
        #
        # @return [Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PUT",
            path: "/api/health-care-code-informations/v1/#{params[:encounter_id]}",
            body: Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationUpdate.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::EncounterId] :encounter_id
        #
        # @return [Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse]
        def get_all_for_encounter(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/health-care-code-informations/v1/#{params[:encounter_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
