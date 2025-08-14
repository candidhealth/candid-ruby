# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/create_non_insurance_payer_request"
require_relative "types/non_insurance_payer"
require_relative "types/toggle_non_insurance_payer_enablement_request"
require_relative "types/non_insurance_payer_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "types/non_insurance_payer_page"
require_relative "types/non_insurance_payer_categories_page"
require_relative "types/non_insurance_payer_update_request"
require "async"

module CandidApiClient
  module NonInsurancePayers
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::NonInsurancePayers::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param request [Hash] Request of type CandidApiClient::NonInsurancePayers::V1::Types::CreateNonInsurancePayerRequest, as a Hash
        #   * :name (String)
        #   * :description (String)
        #   * :category (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :clinical_trials (Array<CandidApiClient::ClinicalTrials::V1::Types::MutableClinicalTrial>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.create(request: { name: "name" })
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
                                               request_options: request_options)}/api/non-insurance-payers/v1"
          end
          CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: response.body)
        end

        # @param non_insurance_payer_id [String]
        # @param request [Hash] Request of type CandidApiClient::NonInsurancePayers::V1::Types::ToggleNonInsurancePayerEnablementRequest, as a Hash
        #   * :enabled (Boolean)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.toggle_enablement(non_insurance_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { enabled: true })
        def toggle_enablement(non_insurance_payer_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/non-insurance-payers/v1/#{non_insurance_payer_id}/toggle_enablement"
          end
          CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: response.body)
        end

        # @param name [String]
        # @param category [String] Fuzzy-match category names of non-insurance payers.
        # @param categories_exact [String] Filter by one or more categories by name.
        #  When multiple are present, non-insurance payers with any of the specified
        #  categories will be matched.
        # @param clinical_trial_ids [String] Filter by one or more clinical trials by their `clinical_trial_id`.
        #  When multiple are present, non-insurance payers with any of the specified
        #  clinical trials will be matched.
        # @param enabled [Boolean]
        # @param sort [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerSortField]
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection]
        # @param limit [Integer] Defaults to 100
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.get_multi
        def get_multi(name: nil, category: nil, categories_exact: nil, clinical_trial_ids: nil, enabled: nil,
                      sort: nil, sort_direction: nil, limit: nil, page_token: nil, request_options: nil)
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
              "name": name,
              "category": category,
              "categories_exact": categories_exact,
              "clinical_trial_ids": clinical_trial_ids,
              "enabled": enabled,
              "sort": sort,
              "sort_direction": sort_direction,
              "limit": limit,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/non-insurance-payers/v1"
          end
          CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerPage.from_json(json_object: response.body)
        end

        # Returns a paginated list of all non-insurance payer categories.
        #  Non-insurance payer categories are simply strings and are not stored as a
        #  separate object in Candid. They are created when added to at least one
        #  non-insurance payer's `category` field and are deleted when there are no
        #  longer any non-insurance payers that contain them.
        #
        # @param search_term [String] Filters categories by fuzzy matching on name.
        # @param limit [Integer] Limits the maximum number of categories that will be returned. Defaults to 100.
        # @param page_token [String] The page token to continue paging through a previous request.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.get_categories
        def get_categories(search_term: nil, limit: nil, page_token: nil, request_options: nil)
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
              "search_term": search_term,
              "limit": limit,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/non-insurance-payers/v1/categories"
          end
          CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage.from_json(json_object: response.body)
        end

        # @param non_insurance_payer_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.get(non_insurance_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(non_insurance_payer_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/non-insurance-payers/v1/#{non_insurance_payer_id}"
          end
          CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: response.body)
        end

        # @param non_insurance_payer_id [String]
        # @param request [Hash] Request of type CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerUpdateRequest, as a Hash
        #   * :name (String)
        #   * :description (Hash)
        #   * :category (Hash)
        #   * :address (Hash)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.update(non_insurance_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(non_insurance_payer_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/non-insurance-payers/v1/#{non_insurance_payer_id}"
          end
          CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: response.body)
        end

        # @param non_insurance_payer_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.delete(non_insurance_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(non_insurance_payer_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/non-insurance-payers/v1/#{non_insurance_payer_id}"
          end
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::NonInsurancePayers::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param request [Hash] Request of type CandidApiClient::NonInsurancePayers::V1::Types::CreateNonInsurancePayerRequest, as a Hash
        #   * :name (String)
        #   * :description (String)
        #   * :category (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :clinical_trials (Array<CandidApiClient::ClinicalTrials::V1::Types::MutableClinicalTrial>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.create(request: { name: "name" })
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
                                                 request_options: request_options)}/api/non-insurance-payers/v1"
            end
            CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: response.body)
          end
        end

        # @param non_insurance_payer_id [String]
        # @param request [Hash] Request of type CandidApiClient::NonInsurancePayers::V1::Types::ToggleNonInsurancePayerEnablementRequest, as a Hash
        #   * :enabled (Boolean)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.toggle_enablement(non_insurance_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { enabled: true })
        def toggle_enablement(non_insurance_payer_id:, request:, request_options: nil)
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
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/non-insurance-payers/v1/#{non_insurance_payer_id}/toggle_enablement"
            end
            CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: response.body)
          end
        end

        # @param name [String]
        # @param category [String] Fuzzy-match category names of non-insurance payers.
        # @param categories_exact [String] Filter by one or more categories by name.
        #  When multiple are present, non-insurance payers with any of the specified
        #  categories will be matched.
        # @param clinical_trial_ids [String] Filter by one or more clinical trials by their `clinical_trial_id`.
        #  When multiple are present, non-insurance payers with any of the specified
        #  clinical trials will be matched.
        # @param enabled [Boolean]
        # @param sort [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerSortField]
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection]
        # @param limit [Integer] Defaults to 100
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.get_multi
        def get_multi(name: nil, category: nil, categories_exact: nil, clinical_trial_ids: nil, enabled: nil,
                      sort: nil, sort_direction: nil, limit: nil, page_token: nil, request_options: nil)
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
                "name": name,
                "category": category,
                "categories_exact": categories_exact,
                "clinical_trial_ids": clinical_trial_ids,
                "enabled": enabled,
                "sort": sort,
                "sort_direction": sort_direction,
                "limit": limit,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/non-insurance-payers/v1"
            end
            CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerPage.from_json(json_object: response.body)
          end
        end

        # Returns a paginated list of all non-insurance payer categories.
        #  Non-insurance payer categories are simply strings and are not stored as a
        #  separate object in Candid. They are created when added to at least one
        #  non-insurance payer's `category` field and are deleted when there are no
        #  longer any non-insurance payers that contain them.
        #
        # @param search_term [String] Filters categories by fuzzy matching on name.
        # @param limit [Integer] Limits the maximum number of categories that will be returned. Defaults to 100.
        # @param page_token [String] The page token to continue paging through a previous request.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.get_categories
        def get_categories(search_term: nil, limit: nil, page_token: nil, request_options: nil)
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
                "search_term": search_term,
                "limit": limit,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/non-insurance-payers/v1/categories"
            end
            CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage.from_json(json_object: response.body)
          end
        end

        # @param non_insurance_payer_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.get(non_insurance_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(non_insurance_payer_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/non-insurance-payers/v1/#{non_insurance_payer_id}"
            end
            CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: response.body)
          end
        end

        # @param non_insurance_payer_id [String]
        # @param request [Hash] Request of type CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerUpdateRequest, as a Hash
        #   * :name (String)
        #   * :description (Hash)
        #   * :category (Hash)
        #   * :address (Hash)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.update(non_insurance_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(non_insurance_payer_id:, request:, request_options: nil)
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
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/non-insurance-payers/v1/#{non_insurance_payer_id}"
            end
            CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: response.body)
          end
        end

        # @param non_insurance_payer_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payers.v_1.delete(non_insurance_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(non_insurance_payer_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/non-insurance-payers/v1/#{non_insurance_payer_id}"
            end
          end
        end
      end
    end
  end
end
