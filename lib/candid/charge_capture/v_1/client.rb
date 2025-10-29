# frozen_string_literal: true

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
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/charge_captures/v1",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCapture::V1::Types::ChargeCapture.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
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
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/charge_captures/v1/create-from-pre-encounter",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCapture::V1::Types::ChargeCapture.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::ChargeCapture::V1::Types::ChargeCapture]
        def update(request_options: {}, **params)
          _path_param_names = ["charge_capture_id"]

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/charge_captures/v1/#{params[:charge_capture_id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCapture::V1::Types::ChargeCapture.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::ChargeCapture::V1::Types::ChargeCapture]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/charge_captures/v1/#{params[:charge_capture_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCapture::V1::Types::ChargeCapture.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::ChargeCapture::V1::Types::ChargeCapturePage]
        def get_all(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit sort sort_direction page_token patient_external_id status charge_external_id
                                  date_of_service_min date_of_service_max claim_ids claim_creation_ids billing_provider_npis service_facility_name primary_payer_ids rendering_provider_npis rendering_provider_names supervising_provider_npis supervising_provider_names claim_creation_category tags primary_payer_names patient_names exclude_charges_linked_to_claims patient_external_id_ranked_sort status_ranked_sort charge_external_id_ranked_sort date_of_service_min_ranked_sort date_of_service_max_ranked_sort search_term billable_status responsible_party claim_ids_ranked_sort claim_creation_ids_ranked_sort billing_provider_npis_ranked_sort service_facility_name_ranked_sort primary_payer_ids_ranked_sort rendering_provider_npis_ranked_sort rendering_provider_names_ranked_sort supervising_provider_npis_ranked_sort supervising_provider_names_ranked_sort claim_status claim_creation_category_ranked_sort tags_ranked_sort primary_payer_names_ranked_sort patient_names_ranked_sort]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/charge_captures/v1",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ChargeCapture::V1::Types::ChargeCapturePage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Array[Candid::ChargeCapture::V1::Types::ChargeCapturePostBilledChange]]
        def update_post_billed_changes(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/charge_captures/v1/changes/",
            body: params
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
