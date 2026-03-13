# frozen_string_literal: true

module Candid
  module Encounters
    module V4
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
        # @option params [Integer, nil] :limit
        # @option params [Candid::Claims::Types::ClaimStatus, nil] :claim_status
        # @option params [Candid::Encounters::V4::Types::EncounterSortOptions, nil] :sort
        # @option params [String, nil] :page_token
        # @option params [String, nil] :date_of_service_min
        # @option params [String, nil] :date_of_service_max
        # @option params [String, nil] :primary_payer_names
        # @option params [String, nil] :search_term
        # @option params [String, nil] :external_id
        # @option params [String, nil] :diagnoses_updated_since
        # @option params [String, nil] :tag_ids
        # @option params [String, nil] :work_queue_id
        # @option params [Candid::Encounters::V4::Types::BillableStatusType, nil] :billable_status
        # @option params [Candid::Encounters::V4::Types::ResponsiblePartyType, nil] :responsible_party
        # @option params [Candid::Encounters::V4::Types::EncounterOwnerOfNextActionType, nil] :owner_of_next_action
        # @option params [String, nil] :patient_external_id
        # @option params [Boolean, nil] :include_merged_patient_data
        #
        # @return [Candid::Encounters::V4::Types::EncounterPage]
        def get_all(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit claim_status sort page_token date_of_service_min date_of_service_max primary_payer_names search_term external_id diagnoses_updated_since tag_ids work_queue_id billable_status responsible_party owner_of_next_action patient_external_id include_merged_patient_data]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["claim_status"] = params[:claim_status] if params.key?(:claim_status)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["date_of_service_min"] = params[:date_of_service_min] if params.key?(:date_of_service_min)
          query_params["date_of_service_max"] = params[:date_of_service_max] if params.key?(:date_of_service_max)
          query_params["primary_payer_names"] = params[:primary_payer_names] if params.key?(:primary_payer_names)
          query_params["search_term"] = params[:search_term] if params.key?(:search_term)
          query_params["external_id"] = params[:external_id] if params.key?(:external_id)
          query_params["diagnoses_updated_since"] = params[:diagnoses_updated_since] if params.key?(:diagnoses_updated_since)
          query_params["tag_ids"] = params[:tag_ids] if params.key?(:tag_ids)
          query_params["work_queue_id"] = params[:work_queue_id] if params.key?(:work_queue_id)
          query_params["billable_status"] = params[:billable_status] if params.key?(:billable_status)
          query_params["responsible_party"] = params[:responsible_party] if params.key?(:responsible_party)
          query_params["owner_of_next_action"] = params[:owner_of_next_action] if params.key?(:owner_of_next_action)
          query_params["patient_external_id"] = params[:patient_external_id] if params.key?(:patient_external_id)
          query_params["include_merged_patient_data"] = params[:include_merged_patient_data] if params.key?(:include_merged_patient_data)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/encounters/v4",
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
            Candid::Encounters::V4::Types::EncounterPage.load(response.body)
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
        # @option params [Candid::Commons::Types::EncounterId] :encounter_id
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/encounters/v4/#{params[:encounter_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Notice: The UB-04 Data File, 2025, is copyrighted by American Hospital Association (AHA), Chicago, Illinois.
        # No portion of the THE UB-04 Data File, may be reproduced, stored in a retrieval system, or transmitted,
        # in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise, without prior
        # express, written consent of AHA.
        #
        # @param request_options [Hash]
        # @param params [Candid::EncountersUniversal::Types::UniversalEncounterCreate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def create_universal(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/encounters/v4/universal",
            body: Candid::EncountersUniversal::Types::UniversalEncounterCreate.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::Encounters::V4::Types::EncounterCreate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/encounters/v4",
            body: Candid::Encounters::V4::Types::EncounterCreate.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create an encounter from a pre-encounter patient and appointment. This endpoint is intended to be used by
        # consumers who are managing
        # patients and appointments in the pre-encounter service and is currently under development. Consumers who are
        # not taking advantage
        # of the pre-encounter service should use the standard create endpoint.
        #
        # The endpoint will create an encounter from the provided fields, pulling information from the provided patient
        # and appointment objects
        # where applicable. In particular, the following fields are populated from the patient and appointment objects:
        #   - Patient
        #   - Referring Provider
        #   - Subscriber Primary
        #   - Subscriber Secondary
        #   - Referral Number
        #   - Responsible Party
        #   - Guarantor
        #
        # Utilizing this endpoint opts you into automatic updating of the encounter when the patient or appointment is
        # updated, assuming the
        # encounter has not already been submitted or adjudicated.
        #
        # Notice: The UB-04 Data File, 2025, is copyrighted by American Hospital Association (AHA), Chicago, Illinois.
        # No portion of the THE UB-04 Data File, may be reproduced, stored in a retrieval system, or transmitted,
        # in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise, without prior
        # express, written consent of AHA.
        #
        # @param request_options [Hash]
        # @param params [Candid::EncountersUniversal::Types::UniversalEncounterCreateFromPreEncounter]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def create_from_pre_encounter_patient_universal(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/encounters/v4/create-from-pre-encounter/universal",
            body: Candid::EncountersUniversal::Types::UniversalEncounterCreateFromPreEncounter.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create an encounter from a pre-encounter patient and appointment. This endpoint is intended to be used by
        # consumers who are managing
        # patients and appointments in the pre-encounter service and is currently under development. Consumers who are
        # not taking advantage
        # of the pre-encounter service should use the standard create endpoint.
        #
        # The endpoint will create an encounter from the provided fields, pulling information from the provided patient
        # and appointment objects
        # where applicable. In particular, the following fields are populated from the patient and appointment objects:
        #   - Patient
        #   - Referring Provider
        #   - Subscriber Primary
        #   - Subscriber Secondary
        #   - Referral Number
        #   - Responsible Party
        #   - Guarantor
        #
        # Utilizing this endpoint opts you into automatic updating of the encounter when the patient or appointment is
        # updated, assuming the
        # encounter has not already been submitted or adjudicated.
        #
        # @param request_options [Hash]
        # @param params [Candid::Encounters::V4::Types::EncounterCreateFromPreEncounter]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def create_from_pre_encounter_patient(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/encounters/v4/create-from-pre-encounter",
            body: Candid::Encounters::V4::Types::EncounterCreateFromPreEncounter.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Notice: The UB-04 Data File, 2025, is copyrighted by American Hospital Association (AHA), Chicago, Illinois.
        # No portion of the THE UB-04 Data File, may be reproduced, stored in a retrieval system, or transmitted,
        # in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise, without prior
        # express, written consent of AHA.
        #
        # @param request_options [Hash]
        # @param params [Candid::EncountersUniversal::Types::UniversalEncounterUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::EncounterId] :encounter_id
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def update_universal(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/encounters/v4/#{params[:encounter_id]}/universal",
            body: Candid::EncountersUniversal::Types::UniversalEncounterUpdate.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::Encounters::V4::Types::EncounterUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::EncounterId] :encounter_id
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/encounters/v4/#{params[:encounter_id]}",
            body: Candid::Encounters::V4::Types::EncounterUpdate.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
