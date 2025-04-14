# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../commons/types/source_of_payment_code"
require_relative "types/payer_plan_group_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "types/payer_plan_group_page"
require_relative "types/payer_plan_group"
require_relative "types/mutable_payer_plan_group"
require "async"

module CandidApiClient
  module PayerPlanGroups
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::PayerPlanGroups::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all payer plan groups matching filter criteria.
        #
        # @param plan_group_name [String]
        # @param payer_uuid [String]
        # @param payer_id [String]
        # @param plan_type [CandidApiClient::Commons::Types::SourceOfPaymentCode]
        # @param is_active [Boolean]
        # @param payer_plan_group_id [String]
        # @param limit [Integer] Defaults to 100. Cannot exc
        # @param sort_by_similarity [String] If this property is passed, the results will be ordered by those that contain a
        #  payer_id, payer_name, plan_group_name, or
        #  payer_address most similar to the value passed. This will take precedence over
        #  the sort and sort_direction properties. This
        #  will always sort in order of most similar to least similar.
        # @param sort [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroupSortField] Defaults to plan_group_name. If sort_by_similarity is passed, that sort will
        #  takes precedence over this property.
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to ascending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroupPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.payer_plan_groups.v_1.get_multi(
        #    plan_group_name: "string",
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    payer_id: "string",
        #    plan_type: SELF_PAY,
        #    is_active: true,
        #    payer_plan_group_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    limit: 1,
        #    sort_by_similarity: "string",
        #    sort: PLAN_GROUP_NAME,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(plan_group_name: nil, payer_uuid: nil, payer_id: nil, plan_type: nil, is_active: nil,
                      payer_plan_group_id: nil, limit: nil, sort_by_similarity: nil, sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
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
              "plan_group_name": plan_group_name,
              "payer_uuid": payer_uuid,
              "payer_id": payer_id,
              "plan_type": plan_type,
              "is_active": is_active,
              "payer_plan_group_id": payer_plan_group_id,
              "limit": limit,
              "sort_by_similarity": sort_by_similarity,
              "sort": sort,
              "sort_direction": sort_direction,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/payer-plan-groups/v1"
          end
          CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroupPage.from_json(json_object: response.body)
        end

        # Return a plan group with a given ID.
        #
        # @param payer_plan_group_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.payer_plan_groups.v_1.get(payer_plan_group_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(payer_plan_group_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/payer-plan-groups/v1/#{payer_plan_group_id}"
          end
          CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup.from_json(json_object: response.body)
        end

        # Create a payer plan group
        #
        # @param request [Hash] Request of type CandidApiClient::PayerPlanGroups::V1::Types::MutablePayerPlanGroup, as a Hash
        #   * :plan_group_name (String)
        #   * :payer_uuid (String)
        #   * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.payer_plan_groups.v_1.create(request: { plan_group_name: "string", payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", plan_type: SELF_PAY })
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
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/payer-plan-groups/v1"
          end
          CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup.from_json(json_object: response.body)
        end

        # Update any of the fields on a payer plan group
        #
        # @param payer_plan_group_id [String]
        # @param request [Hash] Request of type CandidApiClient::PayerPlanGroups::V1::Types::MutablePayerPlanGroup, as a Hash
        #   * :plan_group_name (String)
        #   * :payer_uuid (String)
        #   * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.payer_plan_groups.v_1.update(payer_plan_group_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { plan_group_name: "string", payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", plan_type: SELF_PAY })
        def update(payer_plan_group_id:, request:, request_options: nil)
          response = @request_client.conn.put do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/payer-plan-groups/v1/#{payer_plan_group_id}"
          end
          CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup.from_json(json_object: response.body)
        end

        # Marks the payer plan group as deactivated
        #
        # @param payer_plan_group_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.payer_plan_groups.v_1.deactivate(payer_plan_group_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def deactivate(payer_plan_group_id:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/payer-plan-groups/v1/#{payer_plan_group_id}"
          end
          CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::PayerPlanGroups::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all payer plan groups matching filter criteria.
        #
        # @param plan_group_name [String]
        # @param payer_uuid [String]
        # @param payer_id [String]
        # @param plan_type [CandidApiClient::Commons::Types::SourceOfPaymentCode]
        # @param is_active [Boolean]
        # @param payer_plan_group_id [String]
        # @param limit [Integer] Defaults to 100. Cannot exc
        # @param sort_by_similarity [String] If this property is passed, the results will be ordered by those that contain a
        #  payer_id, payer_name, plan_group_name, or
        #  payer_address most similar to the value passed. This will take precedence over
        #  the sort and sort_direction properties. This
        #  will always sort in order of most similar to least similar.
        # @param sort [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroupSortField] Defaults to plan_group_name. If sort_by_similarity is passed, that sort will
        #  takes precedence over this property.
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to ascending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroupPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.payer_plan_groups.v_1.get_multi(
        #    plan_group_name: "string",
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    payer_id: "string",
        #    plan_type: SELF_PAY,
        #    is_active: true,
        #    payer_plan_group_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    limit: 1,
        #    sort_by_similarity: "string",
        #    sort: PLAN_GROUP_NAME,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(plan_group_name: nil, payer_uuid: nil, payer_id: nil, plan_type: nil, is_active: nil,
                      payer_plan_group_id: nil, limit: nil, sort_by_similarity: nil, sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
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
                "plan_group_name": plan_group_name,
                "payer_uuid": payer_uuid,
                "payer_id": payer_id,
                "plan_type": plan_type,
                "is_active": is_active,
                "payer_plan_group_id": payer_plan_group_id,
                "limit": limit,
                "sort_by_similarity": sort_by_similarity,
                "sort": sort,
                "sort_direction": sort_direction,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/payer-plan-groups/v1"
            end
            CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroupPage.from_json(json_object: response.body)
          end
        end

        # Return a plan group with a given ID.
        #
        # @param payer_plan_group_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.payer_plan_groups.v_1.get(payer_plan_group_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(payer_plan_group_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/payer-plan-groups/v1/#{payer_plan_group_id}"
            end
            CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup.from_json(json_object: response.body)
          end
        end

        # Create a payer plan group
        #
        # @param request [Hash] Request of type CandidApiClient::PayerPlanGroups::V1::Types::MutablePayerPlanGroup, as a Hash
        #   * :plan_group_name (String)
        #   * :payer_uuid (String)
        #   * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.payer_plan_groups.v_1.create(request: { plan_group_name: "string", payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", plan_type: SELF_PAY })
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
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/payer-plan-groups/v1"
            end
            CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup.from_json(json_object: response.body)
          end
        end

        # Update any of the fields on a payer plan group
        #
        # @param payer_plan_group_id [String]
        # @param request [Hash] Request of type CandidApiClient::PayerPlanGroups::V1::Types::MutablePayerPlanGroup, as a Hash
        #   * :plan_group_name (String)
        #   * :payer_uuid (String)
        #   * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.payer_plan_groups.v_1.update(payer_plan_group_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { plan_group_name: "string", payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", plan_type: SELF_PAY })
        def update(payer_plan_group_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.put do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/payer-plan-groups/v1/#{payer_plan_group_id}"
            end
            CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup.from_json(json_object: response.body)
          end
        end

        # Marks the payer plan group as deactivated
        #
        # @param payer_plan_group_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.payer_plan_groups.v_1.deactivate(payer_plan_group_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def deactivate(payer_plan_group_id:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/payer-plan-groups/v1/#{payer_plan_group_id}"
            end
            CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
