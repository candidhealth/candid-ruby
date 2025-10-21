
module Candid
  module InsuranceAdjudications
    module V1
      class Client
        # @return [Candid::InsuranceAdjudications::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Retrieves a previously created insurance adjudication by its `insurance_adjudication_id`.
        #
        # @return [Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudication]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudication.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a new insurance adjudication record and returns the newly created InsuranceAdjudication object.
        #
        # @return [Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudication]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/insurance-adjudications/v1",
            body: Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudicationCreate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudication.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes the insurance adjudication record matching the provided insurance_adjudication_id.
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
