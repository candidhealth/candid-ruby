
module Candid
  module Tasks
    module V3
      class Client
        # @return [Candid::Tasks::V3::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::Tasks::V3::Types::TaskActions]
        def get_actions(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Tasks::V3::Types::TaskActions.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Tasks::V3::Types::TaskPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Tasks::V3::Types::TaskPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Tasks::V3::Types::Task]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Tasks::V3::Types::Task.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Tasks::V3::Types::Task]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/tasks/v3",
            body: Candid::Tasks::V3::Types::TaskCreateV3.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Tasks::V3::Types::Task.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Tasks::V3::Types::Task]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/tasks/v3/#{params[:task_id]}",
            body: Candid::Tasks::V3::Types::TaskUpdateV3.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Tasks::V3::Types::Task.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
