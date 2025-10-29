# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        class Client
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Sends real-time eligibility checks to payers through Stedi.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheck]
          def post(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/eligibility-checks/v1",
              body: Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityResponse.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Sends a batch of eligibility checks to payers through Stedi.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse]
          def batch(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/eligibility-checks/v1/batch",
              body: params
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Polls the status of a batch eligibility check.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage]
          def poll_batch(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[page_token]
            _query = params.slice(*_query_param_names)
            params = params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/eligibility-checks/v1/batch/#{params[:batch_id]}",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Searches for payers that match the query parameters.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::PayerSearchResponse]
          def payer_search(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[page_size page_token query]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/eligibility-checks/v1/payer/search",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::PayerSearchResponse.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Gets recommendation for eligibility checks based on the request.
          #
          # @return [Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation]]
          def recommendation(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[filters]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/eligibility-checks/v1/recommendation",
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

          # Create an eligibiilty recommendation based on the request.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation]
          def create_recommendation(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/eligibility-checks/v1/recommendation",
              body: Candid::PreEncounter::EligibilityChecks::V1::Types::PostEligibilityRecommendationRequest.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation.load(_response.body)
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
