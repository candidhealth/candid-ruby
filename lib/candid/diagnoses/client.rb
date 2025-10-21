
module Candid
  module Diagnoses
    class Client
      # @return [Candid::Diagnoses::Client]
      def initialize(client:)
        @client = client
      end

      # Creates a new diagnosis for an encounter
      #
      # @return [Candid::Diagnoses::Types::Diagnosis]
      def create(request_options: {}, **params)
        _request = Candid::Internal::JSON::Request.new(
          method: POST,
          path: "/api/diagnoses/v2",
          body: Candid::Diagnoses::Types::StandaloneDiagnosisCreate.new(params[:request]).to_h,
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Candid::Diagnoses::Types::Diagnosis.load(_response.body)
        else
          raise _response.body
        end
      end

      # Updates the diagnosis record matching the provided `diagnosis_id`
      #
      # @return [Candid::Diagnoses::Types::Diagnosis]
      def update(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Candid::Diagnoses::Types::Diagnosis.load(_response.body)
        else
          raise _response.body
        end
      end

      # Deletes the diagnosis record associated with the provided `diagnosis_id`
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
