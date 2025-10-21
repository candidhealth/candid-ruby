
module Candid
  module PreEncounter
    module Tags
      module V1
        class Client
          # @return [Candid::PreEncounter::Tags::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Gets a tag by TagId.
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::Tag]
          def get(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Tags::V1::Types::Tag.load(_response.body)
            else
              raise _response.body
            end
          end

          # Gets all tags. Defaults to page size of 1000.
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::TagPage]
          def get_all(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Tags::V1::Types::TagPage.load(_response.body)
            else
              raise _response.body
            end
          end

          # Adds a new tag if it does not already exist, otherwise, returns the existing tag.
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::Tag]
          def create(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: POST,
              path: "/tags/v1",
              body: Candid::PreEncounter::Tags::V1::Types::MutableTag.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Tags::V1::Types::Tag.load(_response.body)
            else
              raise _response.body
            end
          end

          # Updates a tag. The path must contain the most recent version to prevent races.
          #
          # @return [Candid::PreEncounter::Tags::V1::Types::Tag]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: PUT,
              path: "/tags/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Tags::V1::Types::MutableTag.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Tags::V1::Types::Tag.load(_response.body)
            else
              raise _response.body
            end
          end

          # Sets a tag as deactivated.  The path must contain the most recent version to prevent races.
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

        end
      end
    end
  end
end
