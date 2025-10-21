
module Candid
  module WriteOffs
    module V1
      class Client
        # @return [Candid::WriteOffs::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all write-offs satisfying the search criteria.
        #
        # @return [Candid::WriteOffs::V1::Types::WriteOffsPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::WriteOffs::V1::Types::WriteOffsPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a previously created write off by its `write_off_id`.
        #
        # @return [Candid::WriteOffs::V1::Types::WriteOff]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::WriteOffs::V1::Types::WriteOff.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates one or many write-offs applied toward a specific service line,
        # claim, or billing provider.
        #
        # @return [Candid::WriteOffs::V1::Types::CreateWriteOffsResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::WriteOffs::V1::Types::CreateWriteOffsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Reverts a write off given a `write_off_id`.
        #
        # @return [Candid::WriteOffs::V1::Types::WriteOff]
        def revert(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::WriteOffs::V1::Types::WriteOff.load(_response.body)
          else
            raise _response.body
          end
        end

        # Reverts an Insurance Balance Adjustment given an `adjustment_id`
        #
        # @return [Candid::WriteOffs::V1::Types::WriteOff]
        def revert_insurance_balance_adjustment(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::WriteOffs::V1::Types::WriteOff.load(_response.body)
          else
            raise _response.body
          end
        end

        # Reverts an ERA-originated Insurance Balance Adjustment given an `adjustment_id`
        #
        # @return [String]
        def revert_era_originated_insurance_balance_adjustment(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Commons::Types::AdjustmentId.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
