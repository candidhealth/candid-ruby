# frozen_string_literal: true

module Candid
  module Guarantor
    module V1
      class Client
        # @return [Candid::Guarantor::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Creates a new guarantor and returns the newly created Guarantor object.
        #
        # @return [Candid::Guarantor::V1::Types::Guarantor]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/guarantors/v1/#{params[:encounter_id]}",
            body: Candid::Guarantor::V1::Types::GuarantorCreate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Guarantor::V1::Types::Guarantor.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieves a guarantor by its `guarantor_id`.
        #
        # @return [Candid::Guarantor::V1::Types::Guarantor]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/guarantors/v1/#{params[:guarantor_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Guarantor::V1::Types::Guarantor.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Updates a guarantor by its `guarantor_id`.
        #
        # @return [Candid::Guarantor::V1::Types::Guarantor]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/guarantors/v1/#{params[:guarantor_id]}",
            body: Candid::Guarantor::V1::Types::GuarantorUpdate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Guarantor::V1::Types::Guarantor.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
