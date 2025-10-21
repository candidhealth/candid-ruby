
module Candid
  module PayerPlanGroups
    module V1
      class Client
        # @return [Candid::PayerPlanGroups::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all payer plan groups matching filter criteria.
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroupPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PayerPlanGroups::V1::Types::PayerPlanGroupPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Return a plan group with a given ID.
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(_response.body)
          else
            raise _response.body
          end
        end

        # Create a payer plan group
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/payer-plan-groups/v1",
            body: Candid::PayerPlanGroups::V1::Types::MutablePayerPlanGroup.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(_response.body)
          else
            raise _response.body
          end
        end

        # Update any of the fields on a payer plan group
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PUT,
            path: "/api/payer-plan-groups/v1/#{params[:payer_plan_group_id]}",
            body: Candid::PayerPlanGroups::V1::Types::MutablePayerPlanGroup.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(_response.body)
          else
            raise _response.body
          end
        end

        # Marks the payer plan group as deactivated
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def deactivate(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
