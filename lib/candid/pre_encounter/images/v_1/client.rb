
module Candid
  module PreEncounter
    module Images
      module V1
        class Client
          # @return [Candid::PreEncounter::Images::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Adds an image.  VersionConflictError is returned if a front or back of this coverage already exists.
          #
          # @return [Candid::PreEncounter::Images::V1::Types::Image]
          def create(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: POST,
              path: "/images/v1",
              body: Candid::PreEncounter::Images::V1::Types::MutableImage.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Images::V1::Types::Image.load(_response.body)
            else
              raise _response.body
            end
          end

          # Gets an image by imageId.
          #
          # @return [Candid::PreEncounter::Images::V1::Types::Image]
          def get(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Images::V1::Types::Image.load(_response.body)
            else
              raise _response.body
            end
          end

          # Updates an Image.  The path must contain the most recent version to prevent races.
          #
          # @return [Candid::PreEncounter::Images::V1::Types::Image]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: PUT,
              path: "/images/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Images::V1::Types::MutableImage.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Images::V1::Types::Image.load(_response.body)
            else
              raise _response.body
            end
          end

          # Sets an Image as deactivated.  The path must contain the most recent version to prevent races.
          #
          # @return [untyped]
          def deactivate(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return
            else
              raise _response.body
            end
          end

          # Searches for images that match the query parameters.
          #
          # @return [Array[Candid::PreEncounter::Images::V1::Types::Image]]
          def get_multi(request_options: {}, **params)
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
end
