# frozen_string_literal: true

module Candid
  module EncounterSupplementalInformation
    module V1
      class Client
        # @return [Candid::EncounterSupplementalInformation::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Array[Candid::EncounterSupplementalInformation::V1::Types::SupplementalInformation]]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/encounter-supplemental-information/v1/#{params[:encounter_id]}"
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

        # @return [Candid::EncounterSupplementalInformation::V1::Types::SupplementalInformation]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PUT",
            path: "/api/encounter-supplemental-information/v1/#{params[:encounter_id]}",
            body: Candid::EncounterSupplementalInformation::V1::Types::CreateSupplementalInformationRequest.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::EncounterSupplementalInformation::V1::Types::SupplementalInformation.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::EncounterSupplementalInformation::V1::Types::SupplementalInformation]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/encounter-supplemental-information/v1/#{params[:encounter_id]}/#{params[:supplemental_information_id]}",
            body: Candid::EncounterSupplementalInformation::V1::Types::UpdateSupplementalInformationRequest.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::EncounterSupplementalInformation::V1::Types::SupplementalInformation.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/encounter-supplemental-information/v1/#{params[:encounter_id]}/#{params[:supplemental_information_id]}"
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
