
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
              method: POST,
              path: "/eligibility-checks/v1",
              body: Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityResponse.load(_response.body)
            else
              raise _response.body
            end
          end

          # Sends a batch of eligibility checks to payers through Stedi.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse]
          def batch(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: POST,
              path: "/eligibility-checks/v1/batch",
              body: params[:request],
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse.load(_response.body)
            else
              raise _response.body
            end
          end

          # Polls the status of a batch eligibility check.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage]
          def poll_batch(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage.load(_response.body)
            else
              raise _response.body
            end
          end

          # Searches for payers that match the query parameters.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::PayerSearchResponse]
          def payer_search(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::EligibilityChecks::V1::Types::PayerSearchResponse.load(_response.body)
            else
              raise _response.body
            end
          end

          # Gets recommendation for eligibility checks based on the request.
          #
          # @return [Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation]]
          def recommendation(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return 
            else
              raise _response.body
            end
          end

          # Create an eligibiilty recommendation based on the request.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation]
          def create_recommendation(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: POST,
              path: "/eligibility-checks/v1/recommendation",
              body: Candid::PreEncounter::EligibilityChecks::V1::Types::PostEligibilityRecommendationRequest.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation.load(_response.body)
            else
              raise _response.body
            end
          end

        end
      end
    end
  end
end
