# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
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

          # Sends real-time eligibility checks to payers through Stedi.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheck]
          def post(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/eligibility-checks/v1",
              body: Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityResponse.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Sends a batch of eligibility checks to payers through Stedi.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse]
          def batch(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/eligibility-checks/v1/batch",
              body: params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Polls the status of a batch eligibility check.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :batch_id
          # @option params [String, nil] :page_token
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage]
          def poll_batch(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[page_token]
            query_params = {}
            query_params["page_token"] = params[:page_token] if params.key?(:page_token)
            params = params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/eligibility-checks/v1/batch/#{params[:batch_id]}",
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
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Searches for payers that match the query parameters.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Integer, nil] :page_size
          # @option params [String, nil] :page_token
          # @option params [String, nil] :query
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::PayerSearchResponse]
          def payer_search(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[page_size page_token query]
            query_params = {}
            query_params["page_size"] = params[:page_size] if params.key?(:page_size)
            query_params["page_token"] = params[:page_token] if params.key?(:page_token)
            query_params["query"] = params[:query] if params.key?(:query)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/eligibility-checks/v1/payer/search",
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
              Candid::PreEncounter::EligibilityChecks::V1::Types::PayerSearchResponse.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Gets recommendation for eligibility checks based on filters. This endpoint will retrieve all the latest
          # eligibility recommendations for each
          # eligibility recommendation type for the given filters. If you want to get a specific recommendation type,
          # you can use the `type` query parameter.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String, nil] :filters
          #
          # @return [Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation]]
          def recommendation(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[filters]
            query_params = {}
            query_params["filters"] = params[:filters] if params.key?(:filters)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/eligibility-checks/v1/recommendation",
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

          # Create an eligibiilty recommendation based on the request.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::EligibilityChecks::V1::Types::PostEligibilityRecommendationRequest]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation]
          def create_recommendation(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/eligibility-checks/v1/recommendation",
              body: Candid::PreEncounter::EligibilityChecks::V1::Types::PostEligibilityRecommendationRequest.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Submit user feedback on an eligibility recommendation. The path must contain the next version number to
          # prevent race conditions. For example, if the current version of the recommendation is n, you will need to
          # send a request to this endpoint with `/{recommendation_id}/{n+1}/vote` to update the vote.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::EligibilityChecks::V1::Types::Vote]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :recommendation_id
          # @option params [String] :version
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation]
          def vote_recommendation(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "PUT",
              path: "/eligibility-checks/v1/recommendation/#{params[:recommendation_id]}/#{params[:version]}/vote",
              body: Candid::PreEncounter::EligibilityChecks::V1::Types::Vote.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation.load(response.body)
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
          # @option params [String, nil] :page_token
          # @option params [Integer, nil] :limit
          # @option params [String, nil] :subscriber_member_id
          # @option params [String, nil] :payer_id
          # @option params [String, nil] :provider_npi
          # @option params [String, nil] :date_of_service
          # @option params [String, nil] :initiated_at_min
          # @option params [String, nil] :initiated_at_max
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage]
          def get_multi(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[page_token limit subscriber_member_id payer_id provider_npi date_of_service initiated_at_min initiated_at_max]
            query_params = {}
            query_params["page_token"] = params[:page_token] if params.key?(:page_token)
            query_params["limit"] = params[:limit] if params.key?(:limit)
            query_params["subscriber_member_id"] = params[:subscriber_member_id] if params.key?(:subscriber_member_id)
            query_params["payer_id"] = params[:payer_id] if params.key?(:payer_id)
            query_params["provider_npi"] = params[:provider_npi] if params.key?(:provider_npi)
            query_params["date_of_service"] = params[:date_of_service] if params.key?(:date_of_service)
            query_params["initiated_at_min"] = params[:initiated_at_min] if params.key?(:initiated_at_min)
            query_params["initiated_at_max"] = params[:initiated_at_max] if params.key?(:initiated_at_max)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/eligibility-checks/v1/get-multi/",
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
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage.load(response.body)
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
