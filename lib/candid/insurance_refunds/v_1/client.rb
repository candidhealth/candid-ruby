
module Candid
  module InsuranceRefunds
    module V1
      class Client
        # @return [Candid::InsuranceRefunds::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all insurance refunds satisfying the search criteria AND whose organization_id matches
        # the current organization_id of the authenticated user.
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefundsPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::InsuranceRefunds::V1::Types::InsuranceRefundsPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a previously created insurance refund by its `insurance_refund_id`.
        # If the refund does not exist, a `403` will be thrown.
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefund]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::InsuranceRefunds::V1::Types::InsuranceRefund.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a new insurance refund record and returns the newly created `InsuranceRefund` object.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefund]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/insurance-refunds/v1",
            body: Candid::InsuranceRefunds::V1::Types::InsuranceRefundCreate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::InsuranceRefunds::V1::Types::InsuranceRefund.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates the patient refund record matching the provided insurance_refund_id. If updating the refund amount,
        # then the allocations must be appropriately updated as well.
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefund]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::InsuranceRefunds::V1::Types::InsuranceRefund.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes the insurance refund record matching the provided `insurance_refund_id`.
        # If the matching record's organization_id does not match the authenticated user's
        # current organization_id, then a response code of `403` will be returned.
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
