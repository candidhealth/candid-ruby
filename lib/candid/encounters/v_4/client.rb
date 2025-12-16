# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      class Client
        # @return [Candid::Encounters::V4::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::Encounters::V4::Types::EncounterPage]
        def get_all(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit claim_status sort page_token date_of_service_min date_of_service_max
                                  primary_payer_names search_term external_id diagnoses_updated_since tag_ids work_queue_id billable_status responsible_party owner_of_next_action patient_external_id]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/encounters/v4",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::EncounterPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::Encounters::V4::Types::Encounter]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/encounters/v4/#{params[:encounter_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Notice: The UB-04 Data File, 2025, is copyrighted by American Hospital Association (AHA), Chicago, Illinois.
        # No portion of the THE UB-04 Data File, may be reproduced, stored in a retrieval system, or transmitted,
        # in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise, without prior
        # express, written consent of AHA.
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def create_universal(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/encounters/v4/universal",
            body: Candid::EncountersUniversal::Types::UniversalEncounterCreate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::Encounters::V4::Types::Encounter]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/encounters/v4",
            body: Candid::Encounters::V4::Types::EncounterCreate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Create an encounter from a pre-encounter patient and appointment. This endpoint is intended to be used by consumers who are managing
        # patients and appointments in the pre-encounter service and is currently under development. Consumers who are not taking advantage
        # of the pre-encounter service should use the standard create endpoint.
        #
        # The endpoint will create an encounter from the provided fields, pulling information from the provided patient and appointment objects
        # where applicable. In particular, the following fields are populated from the patient and appointment objects:
        #   - Patient
        #   - Referring Provider
        #   - Subscriber Primary
        #   - Subscriber Secondary
        #   - Referral Number
        #   - Responsible Party
        #   - Guarantor
        #
        # Utilizing this endpoint opts you into automatic updating of the encounter when the patient or appointment is updated, assuming the
        # encounter has not already been submitted or adjudicated.
        #
        # Notice: The UB-04 Data File, 2025, is copyrighted by American Hospital Association (AHA), Chicago, Illinois.
        # No portion of the THE UB-04 Data File, may be reproduced, stored in a retrieval system, or transmitted,
        # in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise, without prior
        # express, written consent of AHA.
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def create_from_pre_encounter_patient_universal(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/encounters/v4/create-from-pre-encounter/universal",
            body: Candid::EncountersUniversal::Types::UniversalEncounterCreateFromPreEncounter.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Create an encounter from a pre-encounter patient and appointment. This endpoint is intended to be used by consumers who are managing
        # patients and appointments in the pre-encounter service and is currently under development. Consumers who are not taking advantage
        # of the pre-encounter service should use the standard create endpoint.
        #
        # The endpoint will create an encounter from the provided fields, pulling information from the provided patient and appointment objects
        # where applicable. In particular, the following fields are populated from the patient and appointment objects:
        #   - Patient
        #   - Referring Provider
        #   - Subscriber Primary
        #   - Subscriber Secondary
        #   - Referral Number
        #   - Responsible Party
        #   - Guarantor
        #
        # Utilizing this endpoint opts you into automatic updating of the encounter when the patient or appointment is updated, assuming the
        # encounter has not already been submitted or adjudicated.
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def create_from_pre_encounter_patient(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/encounters/v4/create-from-pre-encounter",
            body: Candid::Encounters::V4::Types::EncounterCreateFromPreEncounter.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Notice: The UB-04 Data File, 2025, is copyrighted by American Hospital Association (AHA), Chicago, Illinois.
        # No portion of the THE UB-04 Data File, may be reproduced, stored in a retrieval system, or transmitted,
        # in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise, without prior
        # express, written consent of AHA.
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def update_universal(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/encounters/v4/#{params[:encounter_id]}/universal",
            body: Candid::EncountersUniversal::Types::UniversalEncounterUpdate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::Encounters::V4::Types::Encounter]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/encounters/v4/#{params[:encounter_id]}",
            body: Candid::Encounters::V4::Types::EncounterUpdate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
