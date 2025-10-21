
module Candid
  module ServiceLines
    module V2
      class Client
        # @return [Candid::ServiceLines::V2::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::ServiceLines::V2::Types::ServiceLine]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/service-lines/v2",
            body: Candid::ServiceLines::V2::Types::ServiceLineCreateStandalone.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ServiceLines::V2::Types::ServiceLine.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::ServiceLines::V2::Types::ServiceLine]
        def create_universal(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/service-lines/v2/universal",
            body: Candid::ServiceLines::V2::Types::UniversalServiceLineCreateStandalone.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ServiceLines::V2::Types::ServiceLine.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::ServiceLines::V2::Types::ServiceLine]
        def update_universal(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/service-lines/v2/#{params[:service_line_id]}/universal",
            body: Candid::ServiceLines::V2::Types::UniversalServiceLineUpdate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ServiceLines::V2::Types::ServiceLine.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::ServiceLines::V2::Types::ServiceLine]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/service-lines/v2/#{params[:service_line_id]}",
            body: Candid::ServiceLines::V2::Types::ServiceLineUpdate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ServiceLines::V2::Types::ServiceLine.load(_response.body)
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
