# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../commons/types/task_id"
require_relative "types/task_actions"
require_relative "../../commons/types/page_token"
require_relative "../commons/types/task_status"
require_relative "../commons/types/task_type"
require "date"
require_relative "../../commons/types/encounter_id"
require_relative "../../commons/types/user_id"
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
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [Tasks::V3::V3Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # @param task_id [Commons::TASK_ID]
        # @param request_options [RequestOptions]
        # @return [Tasks::V3::TaskActions]
        def get_actions(task_id:, request_options: nil)
          response = @request_client.conn.get("/api/tasks/v3/#{task_id}/actions") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Tasks::V3::TaskActions.from_json(json_object: response.body)
        end

        # @param limit [Integer] Defaults to 100
        # @param page_token [Commons::PAGE_TOKEN]
        # @param status [Tasks::Commons::TaskStatus]
        # @param task_type [Tasks::Commons::TaskType]
        # @param categories [String] Only return tasks with categories that match one in this comma-separated list.
        # @param updated_since [DateTime] Only return tasks updated on or after this date-time
        # @param encounter_id [Commons::ENCOUNTER_ID] Only return tasks associated with this encounter
        # @param search_term [String] Query tasks by encounter_id, claim_id, task_id, or external_id
        # @param assigned_to_id [Commons::USER_ID] Only return tasks assigned to this user
        # @param date_of_service_min [Date] The minimum date of service for the linked encounter
        # @param date_of_service_max [Date] The maximum date of service for the linked encounter
        # @param billing_provider_npi [String] The NPI of the billing provider associated with the task's claim
        # @param sort [Tasks::V3::TaskSortOptions] Defaults to updated_at:desc
        # @param request_options [RequestOptions]
        # @return [Tasks::V3::TaskPage]
        def get_multi(limit: nil, page_token: nil, status: nil, task_type: nil, categories: nil, updated_since: nil,
                      encounter_id: nil, search_term: nil, assigned_to_id: nil, date_of_service_min: nil, date_of_service_max: nil, billing_provider_npi: nil, sort: nil, request_options: nil)
          response = @request_client.conn.get("/api/tasks/v3") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
          end
          Tasks::V3::TaskPage.from_json(json_object: response.body)
        end

        # @param task_id [Commons::TASK_ID]
        # @param request_options [RequestOptions]
        # @return [Tasks::V3::Task]
        def get(task_id:, request_options: nil)
          response = @request_client.conn.get("/api/tasks/v3/#{task_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Tasks::V3::Task.from_json(json_object: response.body)
        end

        # @param request [Hash] Request of type Tasks::V3::TaskCreateV3, as a Hash
        #   * :encounter_id (Commons::ENCOUNTER_ID)
        #   * :task_type (Tasks::Commons::TaskType)
        #   * :description (String)
        #   * :blocks_claim_submission (Boolean)
        #   * :assignee_user_id (Commons::USER_ID)
        #   * :category (Tasks::Commons::TaskCategory)
        #   * :work_queue_id (Commons::WORK_QUEUE_ID)
        # @param request_options [RequestOptions]
        # @return [Tasks::V3::Task]
        def create(request:, request_options: nil)
          response = @request_client.conn.post("/api/tasks/v3") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          Tasks::V3::Task.from_json(json_object: response.body)
        end

        # @param task_id [Commons::TASK_ID]
        # @param request [Hash] Request of type Tasks::V3::TaskUpdateV3, as a Hash
        #   * :status (Tasks::Commons::TaskStatus)
        #   * :assignee_user_id (Commons::USER_ID)
        #   * :blocks_claim_submission (Boolean)
        # @param request_options [RequestOptions]
        # @return [Tasks::V3::Task]
        def update(task_id:, request:, request_options: nil)
          response = @request_client.conn.patch("/api/tasks/v3/#{task_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          Tasks::V3::Task.from_json(json_object: response.body)
        end
      end

      class AsyncV3Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [Tasks::V3::AsyncV3Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # @param task_id [Commons::TASK_ID]
        # @param request_options [RequestOptions]
        # @return [Tasks::V3::TaskActions]
        def get_actions(task_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/tasks/v3/#{task_id}/actions") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            Tasks::V3::TaskActions.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Defaults to 100
        # @param page_token [Commons::PAGE_TOKEN]
        # @param status [Tasks::Commons::TaskStatus]
        # @param task_type [Tasks::Commons::TaskType]
        # @param categories [String] Only return tasks with categories that match one in this comma-separated list.
        # @param updated_since [DateTime] Only return tasks updated on or after this date-time
        # @param encounter_id [Commons::ENCOUNTER_ID] Only return tasks associated with this encounter
        # @param search_term [String] Query tasks by encounter_id, claim_id, task_id, or external_id
        # @param assigned_to_id [Commons::USER_ID] Only return tasks assigned to this user
        # @param date_of_service_min [Date] The minimum date of service for the linked encounter
        # @param date_of_service_max [Date] The maximum date of service for the linked encounter
        # @param billing_provider_npi [String] The NPI of the billing provider associated with the task's claim
        # @param sort [Tasks::V3::TaskSortOptions] Defaults to updated_at:desc
        # @param request_options [RequestOptions]
        # @return [Tasks::V3::TaskPage]
        def get_multi(limit: nil, page_token: nil, status: nil, task_type: nil, categories: nil, updated_since: nil,
                      encounter_id: nil, search_term: nil, assigned_to_id: nil, date_of_service_min: nil, date_of_service_max: nil, billing_provider_npi: nil, sort: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/tasks/v3") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
            end
            Tasks::V3::TaskPage.from_json(json_object: response.body)
          end
        end

        # @param task_id [Commons::TASK_ID]
        # @param request_options [RequestOptions]
        # @return [Tasks::V3::Task]
        def get(task_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/tasks/v3/#{task_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            Tasks::V3::Task.from_json(json_object: response.body)
          end
        end

        # @param request [Hash] Request of type Tasks::V3::TaskCreateV3, as a Hash
        #   * :encounter_id (Commons::ENCOUNTER_ID)
        #   * :task_type (Tasks::Commons::TaskType)
        #   * :description (String)
        #   * :blocks_claim_submission (Boolean)
        #   * :assignee_user_id (Commons::USER_ID)
        #   * :category (Tasks::Commons::TaskCategory)
        #   * :work_queue_id (Commons::WORK_QUEUE_ID)
        # @param request_options [RequestOptions]
        # @return [Tasks::V3::Task]
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/tasks/v3") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            Tasks::V3::Task.from_json(json_object: response.body)
          end
        end

        # @param task_id [Commons::TASK_ID]
        # @param request [Hash] Request of type Tasks::V3::TaskUpdateV3, as a Hash
        #   * :status (Tasks::Commons::TaskStatus)
        #   * :assignee_user_id (Commons::USER_ID)
        #   * :blocks_claim_submission (Boolean)
        # @param request_options [RequestOptions]
        # @return [Tasks::V3::Task]
        def update(task_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch("/api/tasks/v3/#{task_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            Tasks::V3::Task.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
