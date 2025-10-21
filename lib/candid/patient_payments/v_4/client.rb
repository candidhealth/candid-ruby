
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
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PatientPayments::V4::Types::PatientPaymentsPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a previously created patient payment by its `patient_payment_id`.
        #
        # @return [Candid::PatientPayments::V4::Types::PatientPayment]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PatientPayments::V4::Types::PatientPayment.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a new patient payment record and returns the newly created PatientPayment object.
        # The allocations can describe whether the payment is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @return [Candid::PatientPayments::V4::Types::PatientPayment]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PatientPayments::V4::Types::PatientPayment.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates the patient payment record matching the provided patient_payment_id.
        #
        # @return [Candid::PatientPayments::V4::Types::PatientPayment]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PatientPayments::V4::Types::PatientPayment.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes the patient payment record matching the provided patient_payment_id.
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
