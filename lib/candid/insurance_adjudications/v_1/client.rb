# frozen_string_literal: true

module Candid
  module InsuranceAdjudications
    module V1
      class Client
        # @return [Candid::InsuranceAdjudications::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Retrieves a previously created insurance adjudication by its `insurance_adjudication_id`.
        #
        # @return [Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudication]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/insurance-adjudications/v1/#{params[:insurance_adjudication_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudication.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Creates a new insurance adjudication record and returns the newly created InsuranceAdjudication object.
        #
        # @return [Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudication]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/insurance-adjudications/v1",
            body: Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudicationCreate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudication.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Deletes the insurance adjudication record matching the provided insurance_adjudication_id.
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/insurance-adjudications/v1/#{params[:insurance_adjudication_id]}"
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
      end
    end
  end
end
