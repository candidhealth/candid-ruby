# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        class Client
          # @return [Candid::PreEncounter::Coverages::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Creates a new Coverage. A Coverage provides the high-level identifiers and descriptors of a specific insurance plan for a specific individual - typically the information you can find on an insurance card. Additionally a coverage will include detailed benefits information covered by the specific plan for the individual.
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::Coverage]
          def create(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/coverages/v1",
              body: Candid::PreEncounter::Coverages::V1::Types::MutableCoverage.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Coverages::V1::Types::Coverage.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Updates a Coverage. The path must contain the next version number to prevent race conditions. For example, if the current version of the coverage is n, you will need to send a request to this endpoint with `/{id}/n+1` to update the coverage. Updating historic versions is not supported.
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::Coverage]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "PUT",
              path: "/coverages/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Coverages::V1::Types::MutableCoverage.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Coverages::V1::Types::Coverage.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Returns a page of Coverages based on the search criteria.
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::CoveragesPage]
          def get_multi_paginated(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[patient_id payer_plan_group_id page_token limit]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/coverages/v1/get-multi-paginated",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Coverages::V1::Types::CoveragesPage.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # gets a specific Coverage
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::Coverage]
          def get(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/coverages/v1/#{params[:id]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Coverages::V1::Types::Coverage.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Gets a coverage's history. Full history is returned if no filters are
          # defined. The return list is ordered by version, defaulting to ascending.
          #
          # @return [Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]]
          def get_history(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[start end non_auto_updated_coverages_only sort_direction limit]
            _query = params.slice(*_query_param_names)
            params = params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/coverages/v1/#{params[:id]}/history",
              query: _query
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

          # Returns a list of Coverages based on the search criteria.
          #
          # @return [Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]]
          def get_multi(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[patient_id]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/coverages/v1",
              query: _query
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

          # Scans up to 100 coverage updates. The since query parameter is inclusive, and the result list is ordered by updatedAt ascending.
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
          # - The `since` parameter is inclusive, so you may receive the last record from the previous batch again (you can deduplicate by ID and version)
          # - All coverage records include `updated_at`, `id`, `version`, `deactivated`, and `updating_user` fields for tracking changes
          # - Timestamps have millisecond resolution for precise ordering
          #
          # @return [Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]]
          def scan(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[since]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/coverages/v1/updates/scan",
              query: _query
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

          # Finds all coverages associated with the given ppg_id and updates the ppg_fields for each coverage.
          #
          # @return [untyped]
          def batch_update_ppg(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/coverages/v1/batch-update-ppg/#{params[:ppg_id]}",
              body: Candid::PreEncounter::Coverages::V1::Types::PayerPlanGroupFields.new(params).to_h
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

          # Initiates an eligibility check. Returns the metadata of the check if successfully initiated.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata]
          def check_eligibility(request_options: {}, **params)
            _path_param_names = ["id"]

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/coverages/v1/#{params[:id]}/eligibility",
              body: params.except(*_path_param_names)
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Gets the eligibility of a patient for a specific coverage if successful.
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse]
          def get_eligibility(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/coverages/v1/#{params[:id]}/eligibility/#{params[:check_id]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end
        end
      end
    end
  end
end
