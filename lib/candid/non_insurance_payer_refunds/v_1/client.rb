
module Candid
  module NonInsurancePayerRefunds
    module V1
      class Client
        # @return [Candid::NonInsurancePayerRefunds::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all non-insurance payer refunds satisfying the search criteria
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a previously created non-insurance payer refund by its `non_insurance_payer_refund_id`.
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a new non-insurance payer refund record and returns the newly created `NonInsurancePayerRefund` object.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/non-insurance-payer-refunds/v1",
            body: Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundCreate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates the non-insurance payer refund record matching the provided non_insurance_payer_refund_id. If updating the refund amount,
        # then the allocations must be appropriately updated as well.
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes the non-insurance payer refund record matching the provided `non_insurance_payer_refund_id`.
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
