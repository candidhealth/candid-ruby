
module Candid
  module EncounterProviders
    module V2
      class Client
        # @return [Candid::EncounterProviders::V2::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::EncounterProviders::V2::Types::EncounterProvider]
        def update_referring_provider(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/encounter-providers/v2/#{params[:encounter_id]}",
            body: Candid::EncounterProviders::V2::Types::ReferringProviderUpdate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::EncounterProviders::V2::Types::EncounterProvider.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::EncounterProviders::V2::Types::EncounterProvider]
        def update_initial_referring_provider(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/encounter-providers/v2/#{params[:encounter_id]}/initial-referring-provider",
            body: Candid::EncounterProviders::V2::Types::InitialReferringProviderUpdate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::EncounterProviders::V2::Types::EncounterProvider.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::EncounterProviders::V2::Types::EncounterProvider]
        def update_supervising_provider(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/encounter-providers/v2/#{params[:encounter_id]}/supervising-provider",
            body: Candid::EncounterProviders::V2::Types::SupervisingProviderUpdate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::EncounterProviders::V2::Types::EncounterProvider.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::EncounterProviders::V2::Types::EncounterProvider]
        def update_ordering_provider(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/encounter-providers/v2/#{params[:service_line_id]}/ordering-provider",
            body: Candid::EncounterProviders::V2::Types::OrderingProviderUpdate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::EncounterProviders::V2::Types::EncounterProvider.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::EncounterProviders::V2::Types::EncounterProvider]
        def create_referring_provider(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/encounter-providers/v2/#{params[:encounter_id]}/create-referring-provider",
            body: Candid::EncounterProviders::V2::Types::ReferringProvider.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::EncounterProviders::V2::Types::EncounterProvider.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::EncounterProviders::V2::Types::EncounterProvider]
        def create_initial_referring_provider(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/encounter-providers/v2/#{params[:encounter_id]}/create-initial-referring-provider",
            body: Candid::EncounterProviders::V2::Types::InitialReferringProvider.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::EncounterProviders::V2::Types::EncounterProvider.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::EncounterProviders::V2::Types::EncounterProvider]
        def create_supervising_provider(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/encounter-providers/v2/#{params[:encounter_id]}/create-supervising-provider",
            body: Candid::EncounterProviders::V2::Types::SupervisingProvider.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::EncounterProviders::V2::Types::EncounterProvider.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::EncounterProviders::V2::Types::EncounterProvider]
        def create_ordering_provider(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/encounter-providers/v2/#{params[:service_line_id]}/create-ordering-provider",
            body: Candid::EncounterProviders::V2::Types::OrderingProvider.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::EncounterProviders::V2::Types::EncounterProvider.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [untyped]
        def delete_referring_provider(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return
          else
            raise _response.body
          end
        end

        # @return [untyped]
        def delete_initial_referring_provider(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return
          else
            raise _response.body
          end
        end

        # @return [untyped]
        def delete_supervising_provider(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return
          else
            raise _response.body
          end
        end

        # @return [untyped]
        def delete_ordering_provider(request_options: {}, **params)
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
