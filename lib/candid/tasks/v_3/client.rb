# frozen_string_literal: true

module Candid
  module Tasks
    module V3
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

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::TaskId] :task_id
        #
        # @return [Candid::Tasks::V3::Types::TaskActions]
        def get_actions(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/tasks/v3/#{params[:task_id]}/actions",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Tasks::V3::Types::TaskActions.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :page_token
        # @option params [Candid::Tasks::Commons::Types::TaskStatus, nil] :status
        # @option params [Candid::Tasks::Commons::Types::TaskType, nil] :task_type
        # @option params [String, nil] :categories
        # @option params [String, nil] :updated_since
        # @option params [String, nil] :encounter_id
        # @option params [String, nil] :search_term
        # @option params [String, nil] :assigned_to_id
        # @option params [String, nil] :date_of_service_min
        # @option params [String, nil] :date_of_service_max
        # @option params [String, nil] :billing_provider_npi
        # @option params [Candid::Tasks::V3::Types::TaskSortOptions, nil] :sort
        #
        # @return [Candid::Tasks::V3::Types::TaskPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit page_token status task_type categories updated_since encounter_id search_term assigned_to_id date_of_service_min date_of_service_max billing_provider_npi sort]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["task_type"] = params[:task_type] if params.key?(:task_type)
          query_params["categories"] = params[:categories] if params.key?(:categories)
          query_params["updated_since"] = params[:updated_since] if params.key?(:updated_since)
          query_params["encounter_id"] = params[:encounter_id] if params.key?(:encounter_id)
          query_params["search_term"] = params[:search_term] if params.key?(:search_term)
          query_params["assigned_to_id"] = params[:assigned_to_id] if params.key?(:assigned_to_id)
          query_params["date_of_service_min"] = params[:date_of_service_min] if params.key?(:date_of_service_min)
          query_params["date_of_service_max"] = params[:date_of_service_max] if params.key?(:date_of_service_max)
          query_params["billing_provider_npi"] = params[:billing_provider_npi] if params.key?(:billing_provider_npi)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/tasks/v3",
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
            Candid::Tasks::V3::Types::TaskPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::TaskId] :task_id
        #
        # @return [Candid::Tasks::V3::Types::Task]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/tasks/v3/#{params[:task_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Tasks::V3::Types::Task.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::Tasks::V3::Types::TaskCreateV3]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::Tasks::V3::Types::Task]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/tasks/v3",
            body: Candid::Tasks::V3::Types::TaskCreateV3.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Tasks::V3::Types::Task.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::Tasks::V3::Types::TaskUpdateV3]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::TaskId] :task_id
        #
        # @return [Candid::Tasks::V3::Types::Task]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/tasks/v3/#{params[:task_id]}",
            body: Candid::Tasks::V3::Types::TaskUpdateV3.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Tasks::V3::Types::Task.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
