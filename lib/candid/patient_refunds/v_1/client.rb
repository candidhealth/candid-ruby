
module Candid
  module PatientRefunds
    module V1
      class Client
        # @return [Candid::PatientRefunds::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all patient refunds satisfying the search criteria AND whose organization_id matches
        # the current organization_id of the authenticated user.
        #
        # @return [Candid::PatientRefunds::V1::Types::PatientRefundsPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PatientRefunds::V1::Types::PatientRefundsPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a previously created patient refund by its `patient_refund_id`.
        #
        # @return [Candid::PatientRefunds::V1::Types::PatientRefund]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PatientRefunds::V1::Types::PatientRefund.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a new patient refund record and returns the newly created PatientRefund object.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @return [Candid::PatientRefunds::V1::Types::PatientRefund]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PatientRefunds::V1::Types::PatientRefund.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates the patient refund record matching the provided patient_refund_id.
        #
        # @return [Candid::PatientRefunds::V1::Types::PatientRefund]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PatientRefunds::V1::Types::PatientRefund.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes the patient refund record matching the provided patient_refund_id.
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
