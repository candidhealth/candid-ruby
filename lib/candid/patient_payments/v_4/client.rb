# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      class Client
        # @return [Candid::PatientPayments::V4::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all patient payments satisfying the search criteria AND whose organization_id matches
        # the current organization_id of the authenticated user.
        #
        # @return [Candid::PatientPayments::V4::Types::PatientPaymentsPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit patient_external_id claim_id service_line_id billing_provider_id unattributed
                                  invoice_id sources sort sort_direction page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/patient-payments/v4",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PatientPayments::V4::Types::PatientPaymentsPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieves a previously created patient payment by its `patient_payment_id`.
        #
        # @return [Candid::PatientPayments::V4::Types::PatientPayment]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/patient-payments/v4/#{params[:patient_payment_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PatientPayments::V4::Types::PatientPayment.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Creates a new patient payment record and returns the newly created PatientPayment object.
        # The allocations can describe whether the payment is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @return [Candid::PatientPayments::V4::Types::PatientPayment]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/patient-payments/v4",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PatientPayments::V4::Types::PatientPayment.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Updates the patient payment record matching the provided patient_payment_id.
        #
        # @return [Candid::PatientPayments::V4::Types::PatientPayment]
        def update(request_options: {}, **params)
          _path_param_names = ["patient_payment_id"]

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/patient-payments/v4/#{params[:patient_payment_id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PatientPayments::V4::Types::PatientPayment.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Deletes the patient payment record matching the provided patient_payment_id.
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/patient-payments/v4/#{params[:patient_payment_id]}"
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
