
module Candid
  module ChargeCapture
    module V1
      class Client
        # @return [Candid::ChargeCapture::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::ChargeCapture::V1::Types::ChargeCapture]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ChargeCapture::V1::Types::ChargeCapture.load(_response.body)
          else
            raise _response.body
          end
        end

        # Create a Charge Capture from a pre-encounter patient and appointment. This endpoint is intended to be used by consumers who are managing
        # patients and appointments in the pre-encounter service and is currently under development. Consumers who are not taking advantage
        # of the pre-encounter service should use the standard create endpoint.
        # 
        # At encounter creation time, information from the provided patient and appointment objects will be populated
        # where applicable. In particular, the following fields are populated from the patient and appointment objects:
        #   - Patient
        #   - Referring Provider
        #   - Subscriber Primary
        #   - Subscriber Secondary
        #   - Referral Number
        #   - Responsible Party
        #   - Guarantor
        # 
        # Note that these fields should not be populated in the ChargeCaptureData property of this endpoint, as they will be overwritten at encounter creation time.
        # 
        # Utilizing this endpoint opts you into automatic updating of the encounter when the patient or appointment is updated, assuming the
        # encounter has not already been submitted or adjudicated.
        #
        # @return [Candid::ChargeCapture::V1::Types::ChargeCapture]
        def create_from_pre_encounter_patient(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ChargeCapture::V1::Types::ChargeCapture.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::ChargeCapture::V1::Types::ChargeCapture]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ChargeCapture::V1::Types::ChargeCapture.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::ChargeCapture::V1::Types::ChargeCapture]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ChargeCapture::V1::Types::ChargeCapture.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::ChargeCapture::V1::Types::ChargeCapturePage]
        def get_all(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ChargeCapture::V1::Types::ChargeCapturePage.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Array[Candid::ChargeCapture::V1::Types::ChargeCapturePostBilledChange]]
        def update_post_billed_changes(request_options: {}, **params)
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
