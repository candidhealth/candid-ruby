# frozen_string_literal: true

module Candid
  module Diagnoses
    class Client
      # @return [Candid::Diagnoses::Client]
      def initialize(client:)
        @client = client
      end

      # Creates a new diagnosis for an encounter
      #
      # @return [Candid::Diagnoses::Types::Diagnosis]
      def create(request_options: {}, **params)
        _request = Candid::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
          method: "POST",
          path: "/api/diagnoses/v2",
          body: Candid::Diagnoses::Types::StandaloneDiagnosisCreate.new(params).to_h
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Candid::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Candid::Diagnoses::Types::Diagnosis.load(_response.body)
        else
          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Updates the diagnosis record matching the provided `diagnosis_id`
      #
      # @return [Candid::Diagnoses::Types::Diagnosis]
      def update(request_options: {}, **params)
        _path_param_names = ["diagnosis_id"]

        _request = Candid::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
          method: "PATCH",
          path: "/api/diagnoses/v2/#{params[:diagnosis_id]}",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Candid::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Candid::Diagnoses::Types::Diagnosis.load(_response.body)
        else
          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Deletes the diagnosis record associated with the provided `diagnosis_id`
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        _request = Candid::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
          method: "DELETE",
          path: "/api/diagnoses/v2/#{params[:diagnosis_id]}"
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
