
module Candid
  module NonInsurancePayers
    module V1
      class Client
        # @return [Candid::NonInsurancePayers::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/non-insurance-payers/v1",
            body: Candid::NonInsurancePayers::V1::Types::CreateNonInsurancePayerRequest.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def toggle_enablement(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/non-insurance-payers/v1/#{params[:non_insurance_payer_id]}/toggle_enablement",
            body: Candid::NonInsurancePayers::V1::Types::ToggleNonInsurancePayerEnablementRequest.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayers::V1::Types::NonInsurancePayerPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Returns a paginated list of all non-insurance payer categories.
        # 
        # Non-insurance payer categories are simply strings and are not stored as a
        # separate object in Candid. They are created when added to at least one
        # non-insurance payer's `category` field and are deleted when there are no
        # longer any non-insurance payers that contain them.
        #
        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage]
        def get_categories(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/non-insurance-payers/v1/#{params[:non_insurance_payer_id]}",
            body: Candid::NonInsurancePayers::V1::Types::NonInsurancePayerUpdateRequest.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [untyped]
        def delete(request_options: {}, **params)
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
