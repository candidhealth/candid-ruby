# frozen_string_literal: true

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
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[plan_group_name payer_uuid payer_id plan_type is_active payer_plan_group_id limit
                                  sort_by_similarity sort sort_direction page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/payer-plan-groups/v1",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroupPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Return a plan group with a given ID.
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/payer-plan-groups/v1/#{params[:payer_plan_group_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Create a payer plan group
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/payer-plan-groups/v1",
            body: Candid::PayerPlanGroups::V1::Types::MutablePayerPlanGroup.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Update any of the fields on a payer plan group
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PUT",
            path: "/api/payer-plan-groups/v1/#{params[:payer_plan_group_id]}",
            body: Candid::PayerPlanGroups::V1::Types::MutablePayerPlanGroup.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Marks the payer plan group as deactivated
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def deactivate(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/payer-plan-groups/v1/#{params[:payer_plan_group_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
