
module Candid
  module FeeSchedules
    module V3
      class Client
        # @return [Candid::FeeSchedules::V3::Client]
        def initialize(client:)
          @client = client
        end

        # Gets the rate that matches a service line.  No result means no rate exists matching the service line's dimensions.
        #
        # @return [Candid::FeeSchedules::V3::Types::MatchResult | nil]
        def get_match(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return 
          else
            raise _response.body
          end
        end

        # Tests a service line against a rate to see if it matches.
        #
        # @return [Candid::FeeSchedules::V3::Types::MatchTestResult]
        def test_match(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::FeeSchedules::V3::Types::MatchTestResult.load(_response.body)
          else
            raise _response.body
          end
        end

        # Gets a list of dimensions with their rates. The rates returned will always be the most recent versions of those rates.
        #
        # @return [Candid::FeeSchedules::V3::Types::RatesPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::FeeSchedules::V3::Types::RatesPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Gets unique values for a dimension based on other selection criteria. The response is a list of dimensions with your criteria and the unique values populated. This API is useful for driving pivots on dimension values.
        #
        # @return [Candid::FeeSchedules::V3::Types::DimensionsPage]
        def get_unique_values_for_dimension(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::FeeSchedules::V3::Types::DimensionsPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Gets every version of a rate.
        #
        # @return [Array[Candid::FeeSchedules::V3::Types::Rate]]
        def get_rate_history(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return 
          else
            raise _response.body
          end
        end

        # Uploads a new fee schedule.\n Each rate may either be totally new as qualified by it's dimensions or a new version for an existing rate.\n If adding a new version to an existing rate, the rate must be posted with the next version number (previous version + 1) or a EntityConflictError will be returned.\n Use the dry run flag to discover already existing rates and to run validations.  If validations for any rate fail, no rates will be saved to the system.
        #
        # @return [Array[Candid::FeeSchedules::V3::Types::Rate]]
        def upload_fee_schedule(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return 
          else
            raise _response.body
          end
        end

        # Soft deletes a rate from the system.  Only the most recent version of a rate can be deleted.
        #
        # @return [untyped]
        def delete_rate(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return
          else
            raise _response.body
          end
        end

        # Gets the default payer threshold
        #
        # @return [Candid::FeeSchedules::V3::Types::PayerThreshold]
        def get_payer_thresholds_default(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::FeeSchedules::V3::Types::PayerThreshold.load(_response.body)
          else
            raise _response.body
          end
        end

        # Gets a list of payers and thresholds by their uuids
        #
        # @return [Candid::FeeSchedules::V3::Types::PayerThresholdsPage]
        def get_payer_thresholds(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::FeeSchedules::V3::Types::PayerThresholdsPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Sets the threshold information for a payer
        #
        # @return [Candid::FeeSchedules::V3::Types::PayerThreshold]
        def set_payer_threshold(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PUT,
            path: "/api/fee-schedules/v3/payer-threshold/#{params[:payer_uuid]}",
            body: Candid::FeeSchedules::V3::Types::PayerThreshold.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::FeeSchedules::V3::Types::PayerThreshold.load(_response.body)
          else
            raise _response.body
          end
        end

        # Hard deletes rates from the system that match the provided dimensions.  This is a destructive operation and cannot be undone.  If an empty dimensions object is provided, all rates will be hard deleted.  The maximum number of rates this API will delete at a time is 10000.  Returns the number of rates deleted and if that number is the maximum, the caller should call this API again to continue deleting rates.
        #
        # @return [Integer]
        def hard_delete_rates(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/fee-schedules/v3/hard-delete",
            body: Candid::FeeSchedules::V3::Types::OptionalDimensions.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return 
          else
            raise _response.body
          end
        end

        # Hard deletes specific rates from the system by their IDs. This is a destructive operation and cannot be undone. Limited to 100 rate IDs maximum per request. For bulk deletion of more than 100 rates, use the hard_delete_rates endpoint with dimension filters. Returns the number of rates deleted.
        #
        # @return [Integer]
        def hard_delete_rates_by_ids(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return 
          else
            raise _response.body
          end
        end

      end
    end
  end
end
