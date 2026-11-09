# frozen_string_literal: true

module Candid
  module PayerGroups
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

        # Returns all payer groups matching filter criteria.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :name
        # @option params [String, nil] :payer_group_id
        # @option params [String, nil] :payer_plan_group_id
        # @option params [Integer, nil] :min_payer_plan_count
        # @option params [Boolean, nil] :include_archived
        # @option params [Integer, nil] :limit
        # @option params [Candid::Commons::Types::SortDirection, nil] :sort_direction
        # @option params [String, nil] :page_token
        #
        # @return [Candid::PayerGroups::V1::Types::PayerGroupPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[name payer_group_id payer_plan_group_id min_payer_plan_count include_archived limit sort_direction page_token]
          query_params = {}
          query_params["name"] = params[:name] if params.key?(:name)
          query_params["payer_group_id"] = params[:payer_group_id] if params.key?(:payer_group_id)
          query_params["payer_plan_group_id"] = params[:payer_plan_group_id] if params.key?(:payer_plan_group_id)
          query_params["min_payer_plan_count"] = params[:min_payer_plan_count] if params.key?(:min_payer_plan_count)
          query_params["include_archived"] = params[:include_archived] if params.key?(:include_archived)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/payer-groups/v1",
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
            Candid::PayerGroups::V1::Types::PayerGroupPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Return a payer group with a given ID.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::PayerGroupId] :payer_group_id
        #
        # @return [Candid::PayerGroups::V1::Types::PayerGroup]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/payer-groups/v1/#{params[:payer_group_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::PayerGroups::V1::Types::PayerGroup.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create a payer group. When `payer_plan_group_ids` is provided, moves those plans into
        # the new group atomically (same transaction). On any failure the group is not created
        # and no plans are moved.
        #
        # @param request_options [Hash]
        # @param params [Candid::PayerGroups::V1::Types::CreatePayerGroupRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::PayerGroups::V1::Types::PayerGroup]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/payer-groups/v1",
            body: Candid::PayerGroups::V1::Types::CreatePayerGroupRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::PayerGroups::V1::Types::PayerGroup.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Update the name of a payer group
        #
        # @param request_options [Hash]
        # @param params [Candid::PayerGroups::V1::Types::MutablePayerGroup]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::PayerGroupId] :payer_group_id
        #
        # @return [Candid::PayerGroups::V1::Types::PayerGroup]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PUT",
            path: "/api/payer-groups/v1/#{params[:payer_group_id]}",
            body: Candid::PayerGroups::V1::Types::MutablePayerGroup.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::PayerGroups::V1::Types::PayerGroup.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
