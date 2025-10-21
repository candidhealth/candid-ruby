
module Candid
  module PreEncounter
    module Notes
      module V1
        class Client
          # @return [Candid::PreEncounter::Notes::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Gets a note by NoteId.
          #
          # @return [Candid::PreEncounter::Notes::V1::Types::Note]
          def get(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Notes::V1::Types::Note.load(_response.body)
            else
              raise _response.body
            end
          end

          # Adds a new note.
          #
          # @return [Candid::PreEncounter::Notes::V1::Types::Note]
          def create(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: POST,
              path: "/notes/v1",
              body: Candid::PreEncounter::Notes::V1::Types::MutableNote.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Notes::V1::Types::Note.load(_response.body)
            else
              raise _response.body
            end
          end

          # Updates a note. The path must contain the most recent version to prevent races.
          #
          # @return [Candid::PreEncounter::Notes::V1::Types::Note]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: PUT,
              path: "/notes/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Notes::V1::Types::MutableNote.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Notes::V1::Types::Note.load(_response.body)
            else
              raise _response.body
            end
          end

          # Sets a note as deactivated.  The path must contain the most recent version to prevent races.
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
