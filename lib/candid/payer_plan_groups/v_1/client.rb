# frozen_string_literal: true

module Candid
  module PayerPlanGroups
    module V1
      class Client
        # @param client [Candid::Internal::Http::RawClient]
        # @param base_url [String, nil]
        # @param environment [Hash[Symbol, String], nil]
        #
        # @return [void]
        def initialize(client:, base_url: nil, environment: nil)
          @client = client
          @base_url = base_url
          @environment = environment
        end

        # Returns all payer plan groups matching filter criteria.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :plan_group_name
        # @option params [String, nil] :payer_uuid
        # @option params [String, nil] :payer_id
        # @option params [Candid::Commons::Types::SourceOfPaymentCode, nil] :plan_type
        # @option params [Boolean, nil] :is_active
        # @option params [String, nil] :payer_plan_group_id
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :sort_by_similarity
        # @option params [Candid::PayerPlanGroups::V1::Types::PayerPlanGroupSortField, nil] :sort
        # @option params [Candid::Commons::Types::SortDirection, nil] :sort_direction
        # @option params [String, nil] :page_token
        # @option params [String, nil] :organization_id
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroupPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[plan_group_name payer_uuid payer_id plan_type is_active payer_plan_group_id limit sort_by_similarity sort sort_direction page_token organization_id]
          query_params = {}
          query_params["plan_group_name"] = params[:plan_group_name] if params.key?(:plan_group_name)
          query_params["payer_uuid"] = params[:payer_uuid] if params.key?(:payer_uuid)
          query_params["payer_id"] = params[:payer_id] if params.key?(:payer_id)
          query_params["plan_type"] = params[:plan_type] if params.key?(:plan_type)
          query_params["is_active"] = params[:is_active] if params.key?(:is_active)
          query_params["payer_plan_group_id"] = params[:payer_plan_group_id] if params.key?(:payer_plan_group_id)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["sort_by_similarity"] = params[:sort_by_similarity] if params.key?(:sort_by_similarity)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["organization_id"] = params[:organization_id] if params.key?(:organization_id)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/payer-plan-groups/v1",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroupPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Return a plan group with a given ID.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::PayerPlanGroupId] :payer_plan_group_id
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/payer-plan-groups/v1/#{params[:payer_plan_group_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create a payer plan group
        #
        # @param request_options [Hash]
        # @param params [Candid::PayerPlanGroups::V1::Types::MutablePayerPlanGroup]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/payer-plan-groups/v1",
            body: Candid::PayerPlanGroups::V1::Types::MutablePayerPlanGroup.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Update any of the fields on a payer plan group
        #
        # @param request_options [Hash]
        # @param params [Candid::PayerPlanGroups::V1::Types::MutablePayerPlanGroup]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::PayerPlanGroupId] :payer_plan_group_id
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PUT",
            path: "/api/payer-plan-groups/v1/#{params[:payer_plan_group_id]}",
            body: Candid::PayerPlanGroups::V1::Types::MutablePayerPlanGroup.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Marks the payer plan group as deactivated
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::PayerPlanGroupId] :payer_plan_group_id
        #
        # @return [Candid::PayerPlanGroups::V1::Types::PayerPlanGroup]
        def deactivate(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/payer-plan-groups/v1/#{params[:payer_plan_group_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::PayerPlanGroups::V1::Types::PayerPlanGroup.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
