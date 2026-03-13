# frozen_string_literal: true

module Candid
  module ChargeCaptureBundles
    module V1
      class Client
        # @param client [Candid::Internal::Http::RawClient]
        # @param base_url [String, nil]
        # @param environment [Hash[Symbol, String], nil]
        #
        # @return [void]
        def initialize(client:, base_url: nil, environment: nil)
          @client = client
          @base_url = base_url
          @environment = environment
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::ChargeCaptureClaimCreationId] :charge_capture_claim_creation_id
        #
        # @return [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreation]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/charge_capture_claim_creation/v1/#{params[:charge_capture_claim_creation_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreation.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationSummary]
        def get_summary(request_options: {}, **params)
          Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/charge_capture_claim_creation/v1/all/summary",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationSummary.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleErrorResolution]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :charge_capture_bundle_error_id
        #
        # @return [untyped]
        def resolve_charge_creation_error(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request_data = Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleErrorResolution.new(params).to_h
          non_body_param_names = ["charge_capture_bundle_error_id"]
          body = request_data.except(*non_body_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/charge_capture_claim_creation/v1/error/#{params[:charge_capture_bundle_error_id]}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer, nil] :limit
        # @option params [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationSortField, nil] :sort
        # @option params [Candid::Commons::Types::SortDirection, nil] :sort_direction
        # @option params [String, nil] :page_token
        # @option params [String, nil] :patient_external_id
        # @option params [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationStatus, nil] :claim_creation_status
        # @option params [Candid::ChargeCapture::V1::Types::ChargeCaptureStatus, nil] :charge_status
        # @option params [String, nil] :charge_external_id
        # @option params [String, nil] :date_of_service_min
        # @option params [String, nil] :date_of_service_max
        # @option params [String, nil] :claim_ids
        # @option params [String, nil] :claim_creation_ids
        # @option params [String, nil] :billing_provider_npis
        # @option params [String, nil] :service_facility_name
        # @option params [String, nil] :primary_payer_ids
        # @option params [String, nil] :rendering_provider_npis
        # @option params [String, nil] :rendering_provider_names
        # @option params [String, nil] :supervising_provider_npis
        # @option params [String, nil] :supervising_provider_names
        # @option params [Candid::Claims::Types::ClaimStatus, nil] :claim_status
        # @option params [String, nil] :claim_creation_category
        # @option params [String, nil] :tags
        # @option params [String, nil] :primary_payer_names
        # @option params [String, nil] :patient_names
        # @option params [Boolean, nil] :has_charge_capture_updates
        #
        # @return [Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationPage]
        def get_all(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit sort sort_direction page_token patient_external_id claim_creation_status charge_status charge_external_id date_of_service_min date_of_service_max claim_ids claim_creation_ids billing_provider_npis service_facility_name primary_payer_ids rendering_provider_npis rendering_provider_names supervising_provider_npis supervising_provider_names claim_status claim_creation_category tags primary_payer_names patient_names has_charge_capture_updates]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["patient_external_id"] = params[:patient_external_id] if params.key?(:patient_external_id)
          query_params["claim_creation_status"] = params[:claim_creation_status] if params.key?(:claim_creation_status)
          query_params["charge_status"] = params[:charge_status] if params.key?(:charge_status)
          query_params["charge_external_id"] = params[:charge_external_id] if params.key?(:charge_external_id)
          query_params["date_of_service_min"] = params[:date_of_service_min] if params.key?(:date_of_service_min)
          query_params["date_of_service_max"] = params[:date_of_service_max] if params.key?(:date_of_service_max)
          query_params["claim_ids"] = params[:claim_ids] if params.key?(:claim_ids)
          query_params["claim_creation_ids"] = params[:claim_creation_ids] if params.key?(:claim_creation_ids)
          query_params["billing_provider_npis"] = params[:billing_provider_npis] if params.key?(:billing_provider_npis)
          query_params["service_facility_name"] = params[:service_facility_name] if params.key?(:service_facility_name)
          query_params["primary_payer_ids"] = params[:primary_payer_ids] if params.key?(:primary_payer_ids)
          query_params["rendering_provider_npis"] = params[:rendering_provider_npis] if params.key?(:rendering_provider_npis)
          query_params["rendering_provider_names"] = params[:rendering_provider_names] if params.key?(:rendering_provider_names)
          query_params["supervising_provider_npis"] = params[:supervising_provider_npis] if params.key?(:supervising_provider_npis)
          query_params["supervising_provider_names"] = params[:supervising_provider_names] if params.key?(:supervising_provider_names)
          query_params["claim_status"] = params[:claim_status] if params.key?(:claim_status)
          query_params["claim_creation_category"] = params[:claim_creation_category] if params.key?(:claim_creation_category)
          query_params["tags"] = params[:tags] if params.key?(:tags)
          query_params["primary_payer_names"] = params[:primary_payer_names] if params.key?(:primary_payer_names)
          query_params["patient_names"] = params[:patient_names] if params.key?(:patient_names)
          query_params["has_charge_capture_updates"] = params[:has_charge_capture_updates] if params.key?(:has_charge_capture_updates)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/charge_capture_claim_creation/v1",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
