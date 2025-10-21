
module Candid
  module OrganizationServiceFacilities
    module V2
      class Client
        # @return [Candid::OrganizationServiceFacilities::V2::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Looks up a single organization service facility by its `external_id` field. This can be useful
        # for finding service facilities within Candid which are associated with service facilities in
        # an external system.
        #
        # @return [Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        def get_by_external_id(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/organization-service-facilities/v2",
            body: Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityCreate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/organization-service-facilities/v2/#{params[:organization_service_facility_id]}",
            body: Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityUpdate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.load(_response.body)
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
