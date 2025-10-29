# frozen_string_literal: true

module Candid
  module NonInsurancePayerPayments
    module V1
      class Client
        # @return [Candid::NonInsurancePayerPayments::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all non-insurance payer payments
        #
        # @return [Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPaymentsPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit non_insurance_payer_id check_number invoice_id sort sort_direction page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/non-insurance-payer-payments/v1",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPaymentsPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieves a previously created non-insurance payer payment by its `non_insurance_payer_payment_id`.
        #
        # @return [Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/non-insurance-payer-payments/v1/#{params[:non_insurance_payer_payment_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/non-insurance-payer-payments/v1",
            body: Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPaymentCreate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment]
        def update(request_options: {}, **params)
          _path_param_names = ["non_insurance_payer_payment_id"]

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/non-insurance-payer-payments/v1/#{params[:non_insurance_payer_payment_id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Deletes the non-insurance payer payment record matching the provided `non_insurance_payer_payment_id`.
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/non-insurance-payer-payments/v1/#{params[:non_insurance_payer_payment_id]}"
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
