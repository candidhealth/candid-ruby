
module Candid
  module ChargeCaptureBundles
    module V1
      class Client
        # @return [Candid::ChargeCaptureBundles::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreation]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreation.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationSummary]
        def get_summary(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationSummary.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [untyped]
        def resolve_charge_creation_error(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return
          else
            raise _response.body
          end
        end

        # @return [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationPage]
        def get_all(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationPage.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
