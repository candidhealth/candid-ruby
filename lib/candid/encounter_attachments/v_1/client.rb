
module Candid
  module EncounterAttachments
    module V1
      class Client
        # @return [Candid::EncounterAttachments::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Array[Candid::EncounterAttachments::V1::Types::EncounterAttachment]]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return 
          else
            raise _response.body
          end
        end

        # Uploads a file to the encounter. The file will be stored in the
        # encounter's attachments.
        #
        # @return [String]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::EncounterAttachments::V1::Types::AttachmentId.load(_response.body)
          else
            raise _response.body
          end
        end

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
