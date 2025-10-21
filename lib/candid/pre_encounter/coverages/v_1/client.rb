
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
              method: POST,
              path: "/coverages/v1",
              body: Candid::PreEncounter::Coverages::V1::Types::MutableCoverage.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Coverages::V1::Types::Coverage.load(_response.body)
            else
              raise _response.body
            end
          end

          # Updates a Coverage. The path must contain the next version number to prevent race conditions. For example, if the current version of the coverage is n, you will need to send a request to this endpoint with `/{id}/n+1` to update the coverage. Updating historic versions is not supported.
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::Coverage]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: PUT,
              path: "/coverages/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Coverages::V1::Types::MutableCoverage.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Coverages::V1::Types::Coverage.load(_response.body)
            else
              raise _response.body
            end
          end

          # Returns a page of Coverages based on the search criteria.
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::CoveragesPage]
          def get_multi_paginated(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Coverages::V1::Types::CoveragesPage.load(_response.body)
            else
              raise _response.body
            end
          end

          # gets a specific Coverage
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::Coverage]
          def get(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Coverages::V1::Types::Coverage.load(_response.body)
            else
              raise _response.body
            end
          end

          # Gets a coverage along with it's full history.  The return list is ordered by version ascending.
          #
          # @return [Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]]
          def get_history(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return 
            else
              raise _response.body
            end
          end

          # Returns a list of Coverages based on the search criteria.
          #
          # @return [Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]]
          def get_multi(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return 
            else
              raise _response.body
            end
          end

          # Scans up to 100 coverage updates.  The since query parameter is inclusive, and the result list is ordered by updatedAt ascending.
          #
          # @return [Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]]
          def scan(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return 
            else
              raise _response.body
            end
          end

          # Finds all coverages associated with the given ppg_id and updates the ppg_fields for each coverage.
          #
          # @return [untyped]
          def batch_update_ppg(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: POST,
              path: "/coverages/v1/batch-update-ppg/#{params[:ppg_id]}",
              body: Candid::PreEncounter::Coverages::V1::Types::PayerPlanGroupFields.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return
            else
              raise _response.body
            end
          end

          # Initiates an eligibility check. Returns the metadata of the check if successfully initiated.
          #
          # @return [Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata]
          def check_eligibility(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata.load(_response.body)
            else
              raise _response.body
            end
          end

          # Gets the eligibility of a patient for a specific coverage if successful.
          #
          # @return [Candid::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse]
          def get_eligibility(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse.load(_response.body)
            else
              raise _response.body
            end
          end

        end
      end
    end
  end
end
