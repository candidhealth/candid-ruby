# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
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

          # Creates a new Coverage. A Coverage provides the high-level identifiers and descriptors of a specific
          # insurance plan for a specific individual - typically the information you can find on an insurance card.
          # Additionally a coverage will include detailed benefits information covered by the specific plan for the
          # individual.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Coverages::V1::Types::MutableCoverage]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::Coverage]
          def create(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/coverages/v1",
              body: Candid::PreEncounter::Coverages::V1::Types::MutableCoverage.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Coverages::V1::Types::Coverage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Updates a Coverage. The path must contain the next version number to prevent race conditions. For example,
          # if the current version of the coverage is n, you will need to send a request to this endpoint with
          # `/{id}/n+1` to update the coverage. Updating historic versions is not supported.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Coverages::V1::Types::MutableCoverage]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::CoverageId] :id
          # @option params [String] :version
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::Coverage]
          def update(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "PUT",
              path: "/coverages/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Coverages::V1::Types::MutableCoverage.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Coverages::V1::Types::Coverage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Returns a page of Coverages based on the search criteria.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String, nil] :patient_id
          # @option params [String, nil] :payer_plan_group_id
          # @option params [String, nil] :page_token
          # @option params [Integer, nil] :limit
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::CoveragesPage]
          def get_multi_paginated(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[patient_id payer_plan_group_id page_token limit]
            query_params = {}
            query_params["patient_id"] = params[:patient_id] if params.key?(:patient_id)
            query_params["payer_plan_group_id"] = params[:payer_plan_group_id] if params.key?(:payer_plan_group_id)
            query_params["page_token"] = params[:page_token] if params.key?(:page_token)
            query_params["limit"] = params[:limit] if params.key?(:limit)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/coverages/v1/get-multi-paginated",
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
              Candid::PreEncounter::Coverages::V1::Types::CoveragesPage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # gets a specific Coverage
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::CoverageId] :id
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::Coverage]
          def get(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/coverages/v1/#{params[:id]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Coverages::V1::Types::Coverage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Gets a coverage's history. Full history is returned if no filters are
          # defined. The return list is ordered by version, defaulting to ascending.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::CoverageId] :id
          # @option params [String, nil] :start
          # @option params [String, nil] :end_
          # @option params [Boolean, nil] :non_auto_updated_coverages_only
          # @option params [Candid::PreEncounter::Common::Types::SortDirection, nil] :sort_direction
          # @option params [Integer, nil] :limit
          #
          # @return [Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]]
          def get_history(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[start end_ non_auto_updated_coverages_only sort_direction limit]
            query_params = {}
            query_params["start"] = params[:start] if params.key?(:start)
            query_params["end"] = params[:end_] if params.key?(:end_)
            query_params["non_auto_updated_coverages_only"] = params[:non_auto_updated_coverages_only] if params.key?(:non_auto_updated_coverages_only)
            query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
            query_params["limit"] = params[:limit] if params.key?(:limit)
            params = params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/coverages/v1/#{params[:id]}/history",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          # Returns a list of Coverages based on the search criteria.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String, nil] :patient_id
          #
          # @return [Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]]
          def get_multi(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[patient_id]
            query_params = {}
            query_params["patient_id"] = params[:patient_id] if params.key?(:patient_id)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/coverages/v1",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          # Scans up to 100 coverage updates. The since query parameter is inclusive, and the result list is ordered by
          # updatedAt ascending.
          #
          # **Polling Pattern:**
          # To continuously poll for updates without gaps:
          # 1. Make your initial request with a `since` timestamp (e.g., `since=2020-01-01T13:00:00.000Z`)
          # 2. The API returns up to 100 coverage records, sorted by `updated_at` ascending
          # 3. Find the `updated_at` value from the last record in the response
          # 4. Use that `updated_at` value as the `since` parameter in your next request
          # 5. Repeat steps 2-4 to ingest updates until you receive an empty list
          #
          # **Important Notes:**
          # - The `since` parameter is inclusive, so you may receive the last record from the previous batch again (you
          # can deduplicate by ID and version)
          # - All coverage records include `updated_at`, `id`, `version`, `deactivated`, and `updating_user` fields for
          # tracking changes
          # - Timestamps have millisecond resolution for precise ordering
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :since
          #
          # @return [Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]]
          def scan(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[since]
            query_params = {}
            query_params["since"] = params[:since] if params.key?(:since)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/coverages/v1/updates/scan",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          # Finds all coverages associated with the given ppg_id and updates the ppg_fields for each coverage.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Coverages::V1::Types::PayerPlanGroupFields]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::PayerPlanGroupId] :ppg_id
          #
          # @return [untyped]
          def batch_update_ppg(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/coverages/v1/batch-update-ppg/#{params[:ppg_id]}",
              body: Candid::PreEncounter::Coverages::V1::Types::PayerPlanGroupFields.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          # Initiates an eligibility check. Returns the metadata of the check if successfully initiated.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Coverages::V1::Types::CheckEligibilityRequest]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::CoverageId] :id
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata]
          def check_eligibility(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request_data = Candid::PreEncounter::Coverages::V1::Types::CheckEligibilityRequest.new(params).to_h
            non_body_param_names = ["id"]
            body = request_data.except(*non_body_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/coverages/v1/#{params[:id]}/eligibility",
              body: body,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Gets the eligibility of a patient for a specific coverage if successful.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::CoverageId] :id
          # @option params [String] :check_id
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse]
          def get_eligibility(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/coverages/v1/#{params[:id]}/eligibility/#{params[:check_id]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end
      end
    end
  end
end
