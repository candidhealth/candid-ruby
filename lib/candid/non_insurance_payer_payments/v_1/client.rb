
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
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPaymentsPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a previously created non-insurance payer payment by its `non_insurance_payer_payment_id`.
        #
        # @return [Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/non-insurance-payer-payments/v1",
            body: Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPaymentCreate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes the non-insurance payer payment record matching the provided `non_insurance_payer_payment_id`.
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return
          else
            raise _response.body
          end
        end

      end
    end
  end
end
