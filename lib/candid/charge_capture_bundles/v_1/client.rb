# frozen_string_literal: true

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
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/charge_capture_claim_creation/v1/#{params[:charge_capture_claim_creation_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreation.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationSummary]
        def get_summary(request_options: {}, **_params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/charge_capture_claim_creation/v1/all/summary"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationSummary.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [untyped]
        def resolve_charge_creation_error(request_options: {}, **params)
          _path_param_names = ["charge_capture_bundle_error_id"]

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/charge_capture_claim_creation/v1/error/#{params[:charge_capture_bundle_error_id]}",
            body: params.except(*_path_param_names)
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

        # @return [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationPage]
        def get_all(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit sort sort_direction page_token patient_external_id claim_creation_status
                                  charge_status charge_external_id date_of_service_min date_of_service_max claim_ids claim_creation_ids billing_provider_npis service_facility_name primary_payer_ids rendering_provider_npis rendering_provider_names supervising_provider_npis supervising_provider_names claim_status claim_creation_category tags primary_payer_names patient_names has_charge_capture_updates]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/charge_capture_claim_creation/v1",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
