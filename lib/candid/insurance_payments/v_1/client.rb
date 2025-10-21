
module Candid
  module InsurancePayments
    module V1
      class Client
        # @return [Candid::InsurancePayments::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all non-ERA originated insurance payments satisfying the search criteria
        #
        # @return [Candid::InsurancePayments::V1::Types::InsurancePaymentsPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::InsurancePayments::V1::Types::InsurancePaymentsPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a previously created insurance payment by its `insurance_payment_id`.
        # If the payment does not exist, a `403` will be thrown.
        #
        # @return [Candid::InsurancePayments::V1::Types::InsurancePayment]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::InsurancePayments::V1::Types::InsurancePayment.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
