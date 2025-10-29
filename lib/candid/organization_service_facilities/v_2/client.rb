# frozen_string_literal: true

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
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/organization-service-facilities/v2/#{params[:organization_service_facility_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit name organization_service_facility_ids external_ids place_of_service_code
                                  page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/organization-service-facilities/v2",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Looks up a single organization service facility by its `external_id` field. This can be useful
        # for finding service facilities within Candid which are associated with service facilities in
        # an external system.
        #
        # @return [Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        def get_by_external_id(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/organization-service-facilities/v2/external-id/#{params[:external_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/organization-service-facilities/v2",
            body: Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityCreate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/organization-service-facilities/v2/#{params[:organization_service_facility_id]}",
            body: Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityUpdate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/organization-service-facilities/v2/#{params[:organization_service_facility_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
