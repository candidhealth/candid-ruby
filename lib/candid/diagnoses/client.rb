# frozen_string_literal: true

module Candid
  module Diagnoses
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

      # Creates a new diagnosis for an encounter
      #
      # @param request_options [Hash]
      # @param params [Candid::Diagnoses::Types::StandaloneDiagnosisCreate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Candid::Diagnoses::Types::Diagnosis]
      def create(request_options: {}, **params)
        params = Candid::Internal::Types::Utils.normalize_keys(params)
        request = Candid::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
          method: "POST",
          path: "/api/diagnoses/v2",
          body: Candid::Diagnoses::Types::StandaloneDiagnosisCreate.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Candid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Candid::Diagnoses::Types::Diagnosis.load(response.body)
        else
          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates the diagnosis record matching the provided `diagnosis_id`
      #
      # @param request_options [Hash]
      # @param params [Candid::Diagnoses::Types::DiagnosisUpdate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Candid::Diagnoses::Types::DiagnosisId] :diagnosis_id
      #
      # @return [Candid::Diagnoses::Types::Diagnosis]
      def update(request_options: {}, **params)
        params = Candid::Internal::Types::Utils.normalize_keys(params)
        request_data = Candid::Diagnoses::Types::DiagnosisUpdate.new(params).to_h
        non_body_param_names = ["diagnosis_id"]
        body = request_data.except(*non_body_param_names)

        request = Candid::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
          method: "PATCH",
          path: "/api/diagnoses/v2/#{params[:diagnosis_id]}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Candid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Candid::Diagnoses::Types::Diagnosis.load(response.body)
        else
          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes the diagnosis record associated with the provided `diagnosis_id`
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Candid::Diagnoses::Types::DiagnosisId] :diagnosis_id
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        params = Candid::Internal::Types::Utils.normalize_keys(params)
        request = Candid::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
          method: "DELETE",
          path: "/api/diagnoses/v2/#{params[:diagnosis_id]}",
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
