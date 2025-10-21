
module Candid
  module Guarantor
    module V1
      class Client
        # @return [Candid::Guarantor::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Creates a new guarantor and returns the newly created Guarantor object.
        #
        # @return [Candid::Guarantor::V1::Types::Guarantor]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/guarantors/v1/#{params[:encounter_id]}",
            body: Candid::Guarantor::V1::Types::GuarantorCreate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Guarantor::V1::Types::Guarantor.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a guarantor by its `guarantor_id`.
        #
        # @return [Candid::Guarantor::V1::Types::Guarantor]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Guarantor::V1::Types::Guarantor.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates a guarantor by its `guarantor_id`.
        #
        # @return [Candid::Guarantor::V1::Types::Guarantor]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/guarantors/v1/#{params[:guarantor_id]}",
            body: Candid::Guarantor::V1::Types::GuarantorUpdate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Guarantor::V1::Types::Guarantor.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
