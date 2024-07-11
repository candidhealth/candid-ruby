# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/task_actions"
require_relative "../commons/types/task_status"
require_relative "../commons/types/task_type"
require "date"
require_relative "types/task_sort_options"
require_relative "types/task_page"
require_relative "types/task"
require_relative "types/task_create_v_3"
require_relative "types/task_update_v_3"
require "async"

module CandidApiClient
  module Tasks
    module V3
      class V3Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::Tasks::V3::V3Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param task_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Tasks::V3::Types::TaskActions]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.tasks.v_3.get_actions(task_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get_actions(task_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/tasks/v3/#{task_id}/actions"
          end
          CandidApiClient::Tasks::V3::Types::TaskActions.from_json(json_object: response.body)
        end

        # @param limit [Integer] Defaults to 100
        # @param page_token [String]
        # @param status [CandidApiClient::Tasks::Commons::Types::TaskStatus]
        # @param task_type [CandidApiClient::Tasks::Commons::Types::TaskType]
        # @param categories [String] Only return tasks with categories that match one in this comma-separated list.
        # @param updated_since [DateTime] Only return tasks updated on or after this date-time
        # @param encounter_id [String] Only return tasks associated with this encounter
        # @param search_term [String] Query tasks by encounter_id, claim_id, task_id, or external_id
        # @param assigned_to_id [String] Only return tasks assigned to this user
        # @param date_of_service_min [Date] The minimum date of service for the linked encounter
        # @param date_of_service_max [Date] The maximum date of service for the linked encounter
        # @param billing_provider_npi [String] The NPI of the billing provider associated with the task's claim
        # @param sort [CandidApiClient::Tasks::V3::Types::TaskSortOptions] Defaults to updated_at:desc
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Tasks::V3::Types::TaskPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.tasks.v_3.get_multi(
        #    limit: 1,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    status: FINISHED,
        #    task_type: CUSTOMER_DATA_REQUEST,
        #    categories: "string",
        #    updated_since: DateTime.parse(2024-01-15T09:30:00.000Z),
        #    encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    search_term: "string",
        #    assigned_to_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    date_of_service_min: DateTime.parse(2023-01-15),
        #    date_of_service_max: DateTime.parse(2023-01-15),
        #    billing_provider_npi: "string",
        #    sort: UPDATED_AT_ASC
        #  )
        def get_multi(limit: nil, page_token: nil, status: nil, task_type: nil, categories: nil, updated_since: nil,
                      encounter_id: nil, search_term: nil, assigned_to_id: nil, date_of_service_min: nil, date_of_service_max: nil, billing_provider_npi: nil, sort: nil, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "page_token": page_token,
              "status": status,
              "task_type": task_type,
              "categories": categories,
              "updated_since": updated_since,
              "encounter_id": encounter_id,
              "search_term": search_term,
              "assigned_to_id": assigned_to_id,
              "date_of_service_min": date_of_service_min,
              "date_of_service_max": date_of_service_max,
              "billing_provider_npi": billing_provider_npi,
              "sort": sort
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/tasks/v3"
          end
          CandidApiClient::Tasks::V3::Types::TaskPage.from_json(json_object: response.body)
        end

        # @param task_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Tasks::V3::Types::Task]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.tasks.v_3.get(task_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(task_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/tasks/v3/#{task_id}"
          end
          CandidApiClient::Tasks::V3::Types::Task.from_json(json_object: response.body)
        end

        # @param request [Hash] Request of type CandidApiClient::Tasks::V3::Types::TaskCreateV3, as a Hash
        #   * :encounter_id (String)
        #   * :task_type (CandidApiClient::Tasks::Commons::Types::TaskType)
        #   * :description (String)
        #   * :blocks_claim_submission (Boolean)
        #   * :assignee_user_id (String)
        #   * :category (CandidApiClient::Tasks::Commons::Types::TaskCategory)
        #   * :work_queue_id (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Tasks::V3::Types::Task]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.tasks.v_3.create(request: { encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", task_type: CUSTOMER_DATA_REQUEST, description: "string", blocks_claim_submission: true, assignee_user_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", category: OTHER, work_queue_id: "string" })
        def create(request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/tasks/v3"
          end
          CandidApiClient::Tasks::V3::Types::Task.from_json(json_object: response.body)
        end

        # @param task_id [String]
        # @param request [Hash] Request of type CandidApiClient::Tasks::V3::Types::TaskUpdateV3, as a Hash
        #   * :status (CandidApiClient::Tasks::Commons::Types::TaskStatus)
        #   * :assignee_user_id (String)
        #   * :blocks_claim_submission (Boolean)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Tasks::V3::Types::Task]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.tasks.v_3.update(task_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { status: FINISHED, assignee_user_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", blocks_claim_submission: true })
        def update(task_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/tasks/v3/#{task_id}"
          end
          CandidApiClient::Tasks::V3::Types::Task.from_json(json_object: response.body)
        end
      end

      class AsyncV3Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::Tasks::V3::AsyncV3Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param task_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Tasks::V3::Types::TaskActions]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.tasks.v_3.get_actions(task_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get_actions(task_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/tasks/v3/#{task_id}/actions"
            end
            CandidApiClient::Tasks::V3::Types::TaskActions.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Defaults to 100
        # @param page_token [String]
        # @param status [CandidApiClient::Tasks::Commons::Types::TaskStatus]
        # @param task_type [CandidApiClient::Tasks::Commons::Types::TaskType]
        # @param categories [String] Only return tasks with categories that match one in this comma-separated list.
        # @param updated_since [DateTime] Only return tasks updated on or after this date-time
        # @param encounter_id [String] Only return tasks associated with this encounter
        # @param search_term [String] Query tasks by encounter_id, claim_id, task_id, or external_id
        # @param assigned_to_id [String] Only return tasks assigned to this user
        # @param date_of_service_min [Date] The minimum date of service for the linked encounter
        # @param date_of_service_max [Date] The maximum date of service for the linked encounter
        # @param billing_provider_npi [String] The NPI of the billing provider associated with the task's claim
        # @param sort [CandidApiClient::Tasks::V3::Types::TaskSortOptions] Defaults to updated_at:desc
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Tasks::V3::Types::TaskPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.tasks.v_3.get_multi(
        #    limit: 1,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    status: FINISHED,
        #    task_type: CUSTOMER_DATA_REQUEST,
        #    categories: "string",
        #    updated_since: DateTime.parse(2024-01-15T09:30:00.000Z),
        #    encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    search_term: "string",
        #    assigned_to_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    date_of_service_min: DateTime.parse(2023-01-15),
        #    date_of_service_max: DateTime.parse(2023-01-15),
        #    billing_provider_npi: "string",
        #    sort: UPDATED_AT_ASC
        #  )
        def get_multi(limit: nil, page_token: nil, status: nil, task_type: nil, categories: nil, updated_since: nil,
                      encounter_id: nil, search_term: nil, assigned_to_id: nil, date_of_service_min: nil, date_of_service_max: nil, billing_provider_npi: nil, sort: nil, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "page_token": page_token,
                "status": status,
                "task_type": task_type,
                "categories": categories,
                "updated_since": updated_since,
                "encounter_id": encounter_id,
                "search_term": search_term,
                "assigned_to_id": assigned_to_id,
                "date_of_service_min": date_of_service_min,
                "date_of_service_max": date_of_service_max,
                "billing_provider_npi": billing_provider_npi,
                "sort": sort
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/tasks/v3"
            end
            CandidApiClient::Tasks::V3::Types::TaskPage.from_json(json_object: response.body)
          end
        end

        # @param task_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Tasks::V3::Types::Task]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.tasks.v_3.get(task_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(task_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/tasks/v3/#{task_id}"
            end
            CandidApiClient::Tasks::V3::Types::Task.from_json(json_object: response.body)
          end
        end

        # @param request [Hash] Request of type CandidApiClient::Tasks::V3::Types::TaskCreateV3, as a Hash
        #   * :encounter_id (String)
        #   * :task_type (CandidApiClient::Tasks::Commons::Types::TaskType)
        #   * :description (String)
        #   * :blocks_claim_submission (Boolean)
        #   * :assignee_user_id (String)
        #   * :category (CandidApiClient::Tasks::Commons::Types::TaskCategory)
        #   * :work_queue_id (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Tasks::V3::Types::Task]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.tasks.v_3.create(request: { encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", task_type: CUSTOMER_DATA_REQUEST, description: "string", blocks_claim_submission: true, assignee_user_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", category: OTHER, work_queue_id: "string" })
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/tasks/v3"
            end
            CandidApiClient::Tasks::V3::Types::Task.from_json(json_object: response.body)
          end
        end

        # @param task_id [String]
        # @param request [Hash] Request of type CandidApiClient::Tasks::V3::Types::TaskUpdateV3, as a Hash
        #   * :status (CandidApiClient::Tasks::Commons::Types::TaskStatus)
        #   * :assignee_user_id (String)
        #   * :blocks_claim_submission (Boolean)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Tasks::V3::Types::Task]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.tasks.v_3.update(task_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { status: FINISHED, assignee_user_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", blocks_claim_submission: true })
        def update(task_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/tasks/v3/#{task_id}"
            end
            CandidApiClient::Tasks::V3::Types::Task.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
