# frozen_string_literal: true

module Candid
  module ChargeCapture
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
        # @param params [Candid::ChargeCapture::V1::Types::CreateChargeCaptureRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::ChargeCapture::V1::Types::ChargeCapture]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/charge_captures/v1",
            body: Candid::ChargeCapture::V1::Types::CreateChargeCaptureRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCapture::V1::Types::ChargeCapture.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create a Charge Capture from a pre-encounter patient and appointment. This endpoint is intended to be used by
        # consumers who are managing
        # patients and appointments in the pre-encounter service and is currently under development. Consumers who are
        # not taking advantage
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
        # Note that these fields should not be populated in the ChargeCaptureData property of this endpoint, as they
        # will be overwritten at encounter creation time.
        #
        # Utilizing this endpoint opts you into automatic updating of the encounter when the patient or appointment is
        # updated, assuming the
        # encounter has not already been submitted or adjudicated.
        #
        # @param request_options [Hash]
        # @param params [Candid::ChargeCapture::V1::Types::CreateChargeCaptureFromPreEncounterRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::ChargeCapture::V1::Types::ChargeCapture]
        def create_from_pre_encounter_patient(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/charge_captures/v1/create-from-pre-encounter",
            body: Candid::ChargeCapture::V1::Types::CreateChargeCaptureFromPreEncounterRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCapture::V1::Types::ChargeCapture.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::ChargeCapture::V1::Types::ChargeCapturePostBilledChangeUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Candid::ChargeCapture::V1::Types::ChargeCapturePostBilledChange]]
        def update_post_billed_changes(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/charge_captures/v1/changes",
            body: Candid::ChargeCapture::V1::Types::ChargeCapturePostBilledChangeUpdate.new(params).to_h,
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
        # @param params [Candid::ChargeCapture::V1::Types::ChargeCaptureUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::ChargeCaptureId] :charge_capture_id
        #
        # @return [Candid::ChargeCapture::V1::Types::ChargeCapture]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request_data = Candid::ChargeCapture::V1::Types::ChargeCaptureUpdate.new(params).to_h
          non_body_param_names = ["charge_capture_id"]
          body = request_data.except(*non_body_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/charge_captures/v1/#{params[:charge_capture_id]}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCapture::V1::Types::ChargeCapture.load(response.body)
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
        # @option params [Candid::Commons::Types::ChargeCaptureId] :charge_capture_id
        #
        # @return [Candid::ChargeCapture::V1::Types::ChargeCapture]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/charge_captures/v1/#{params[:charge_capture_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCapture::V1::Types::ChargeCapture.load(response.body)
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
        # @option params [Integer, nil] :limit
        # @option params [Candid::ChargeCapture::V1::Types::ChargeCaptureSortField, nil] :sort
        # @option params [Candid::Commons::Types::SortDirection, nil] :sort_direction
        # @option params [String, nil] :page_token
        # @option params [String, nil] :patient_external_id
        # @option params [Candid::ChargeCapture::V1::Types::ChargeCaptureStatus, nil] :status
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
        # @option params [String, nil] :claim_creation_category
        # @option params [String, nil] :tags
        # @option params [String, nil] :primary_payer_names
        # @option params [String, nil] :patient_names
        # @option params [Boolean, nil] :exclude_charges_linked_to_claims
        # @option params [String, nil] :patient_external_id_ranked_sort
        # @option params [Candid::ChargeCapture::V1::Types::ChargeCaptureStatus, nil] :status_ranked_sort
        # @option params [String, nil] :charge_external_id_ranked_sort
        # @option params [String, nil] :date_of_service_min_ranked_sort
        # @option params [String, nil] :date_of_service_max_ranked_sort
        # @option params [String, nil] :search_term
        # @option params [Candid::Encounters::V4::Types::BillableStatusType, nil] :billable_status
        # @option params [Candid::Encounters::V4::Types::ResponsiblePartyType, nil] :responsible_party
        # @option params [String, nil] :claim_ids_ranked_sort
        # @option params [String, nil] :claim_creation_ids_ranked_sort
        # @option params [String, nil] :billing_provider_npis_ranked_sort
        # @option params [String, nil] :service_facility_name_ranked_sort
        # @option params [String, nil] :primary_payer_ids_ranked_sort
        # @option params [String, nil] :rendering_provider_npis_ranked_sort
        # @option params [String, nil] :rendering_provider_names_ranked_sort
        # @option params [String, nil] :supervising_provider_npis_ranked_sort
        # @option params [String, nil] :supervising_provider_names_ranked_sort
        # @option params [Candid::Claims::Types::ClaimStatus, nil] :claim_status
        # @option params [String, nil] :claim_creation_category_ranked_sort
        # @option params [String, nil] :tags_ranked_sort
        # @option params [String, nil] :primary_payer_names_ranked_sort
        # @option params [String, nil] :patient_names_ranked_sort
        #
        # @return [Candid::ChargeCapture::V1::Types::ChargeCapturePage]
        def get_all(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit sort sort_direction page_token patient_external_id status charge_external_id date_of_service_min date_of_service_max claim_ids claim_creation_ids billing_provider_npis service_facility_name primary_payer_ids rendering_provider_npis rendering_provider_names supervising_provider_npis supervising_provider_names claim_creation_category tags primary_payer_names patient_names exclude_charges_linked_to_claims patient_external_id_ranked_sort status_ranked_sort charge_external_id_ranked_sort date_of_service_min_ranked_sort date_of_service_max_ranked_sort search_term billable_status responsible_party claim_ids_ranked_sort claim_creation_ids_ranked_sort billing_provider_npis_ranked_sort service_facility_name_ranked_sort primary_payer_ids_ranked_sort rendering_provider_npis_ranked_sort rendering_provider_names_ranked_sort supervising_provider_npis_ranked_sort supervising_provider_names_ranked_sort claim_status claim_creation_category_ranked_sort tags_ranked_sort primary_payer_names_ranked_sort patient_names_ranked_sort]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["patient_external_id"] = params[:patient_external_id] if params.key?(:patient_external_id)
          query_params["status"] = params[:status] if params.key?(:status)
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
          query_params["claim_creation_category"] = params[:claim_creation_category] if params.key?(:claim_creation_category)
          query_params["tags"] = params[:tags] if params.key?(:tags)
          query_params["primary_payer_names"] = params[:primary_payer_names] if params.key?(:primary_payer_names)
          query_params["patient_names"] = params[:patient_names] if params.key?(:patient_names)
          query_params["exclude_charges_linked_to_claims"] = params[:exclude_charges_linked_to_claims] if params.key?(:exclude_charges_linked_to_claims)
          query_params["patient_external_id_ranked_sort"] = params[:patient_external_id_ranked_sort] if params.key?(:patient_external_id_ranked_sort)
          query_params["status_ranked_sort"] = params[:status_ranked_sort] if params.key?(:status_ranked_sort)
          query_params["charge_external_id_ranked_sort"] = params[:charge_external_id_ranked_sort] if params.key?(:charge_external_id_ranked_sort)
          query_params["date_of_service_min_ranked_sort"] = params[:date_of_service_min_ranked_sort] if params.key?(:date_of_service_min_ranked_sort)
          query_params["date_of_service_max_ranked_sort"] = params[:date_of_service_max_ranked_sort] if params.key?(:date_of_service_max_ranked_sort)
          query_params["search_term"] = params[:search_term] if params.key?(:search_term)
          query_params["billable_status"] = params[:billable_status] if params.key?(:billable_status)
          query_params["responsible_party"] = params[:responsible_party] if params.key?(:responsible_party)
          query_params["claim_ids_ranked_sort"] = params[:claim_ids_ranked_sort] if params.key?(:claim_ids_ranked_sort)
          query_params["claim_creation_ids_ranked_sort"] = params[:claim_creation_ids_ranked_sort] if params.key?(:claim_creation_ids_ranked_sort)
          query_params["billing_provider_npis_ranked_sort"] = params[:billing_provider_npis_ranked_sort] if params.key?(:billing_provider_npis_ranked_sort)
          query_params["service_facility_name_ranked_sort"] = params[:service_facility_name_ranked_sort] if params.key?(:service_facility_name_ranked_sort)
          query_params["primary_payer_ids_ranked_sort"] = params[:primary_payer_ids_ranked_sort] if params.key?(:primary_payer_ids_ranked_sort)
          query_params["rendering_provider_npis_ranked_sort"] = params[:rendering_provider_npis_ranked_sort] if params.key?(:rendering_provider_npis_ranked_sort)
          query_params["rendering_provider_names_ranked_sort"] = params[:rendering_provider_names_ranked_sort] if params.key?(:rendering_provider_names_ranked_sort)
          query_params["supervising_provider_npis_ranked_sort"] = params[:supervising_provider_npis_ranked_sort] if params.key?(:supervising_provider_npis_ranked_sort)
          query_params["supervising_provider_names_ranked_sort"] = params[:supervising_provider_names_ranked_sort] if params.key?(:supervising_provider_names_ranked_sort)
          query_params["claim_status"] = params[:claim_status] if params.key?(:claim_status)
          query_params["claim_creation_category_ranked_sort"] = params[:claim_creation_category_ranked_sort] if params.key?(:claim_creation_category_ranked_sort)
          query_params["tags_ranked_sort"] = params[:tags_ranked_sort] if params.key?(:tags_ranked_sort)
          query_params["primary_payer_names_ranked_sort"] = params[:primary_payer_names_ranked_sort] if params.key?(:primary_payer_names_ranked_sort)
          query_params["patient_names_ranked_sort"] = params[:patient_names_ranked_sort] if params.key?(:patient_names_ranked_sort)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/charge_captures/v1",
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
            Candid::ChargeCapture::V1::Types::ChargeCapturePage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
