
module Candid
  module CustomSchemas
    module V1
      class Client
        # @return [Candid::CustomSchemas::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all custom schemas.
        #
        # @return [Candid::CustomSchemas::V1::Types::SchemaGetMultiResponse]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::CustomSchemas::V1::Types::SchemaGetMultiResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Return a custom schema with a given ID.
        #
        # @return [Candid::CustomSchemas::V1::Types::Schema]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::CustomSchemas::V1::Types::Schema.load(_response.body)
          else
            raise _response.body
          end
        end

        # Create custom schema with a set of typed keys. Schema keys can be referenced as inputs in user-configurable rules in the Rules
        # Engine, and key-value pairs can be attached to claims via the Encounters API.
        #
        # @return [Candid::CustomSchemas::V1::Types::Schema]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::CustomSchemas::V1::Types::Schema.load(_response.body)
          else
            raise _response.body
          end
        end

        # Update the name, description, or keys on a preexisting schema.
        #
        # @return [Candid::CustomSchemas::V1::Types::Schema]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::CustomSchemas::V1::Types::Schema.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
