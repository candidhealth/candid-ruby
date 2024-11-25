# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/mutable_patient"
require_relative "types/patient"
require_relative "types/mutable_patient_with_mrn"
require_relative "../../common/types/sort_direction"
require_relative "types/patient_page"
require "json"
require "date"
require "async"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        class V1Client
          # @return [CandidApiClient::RequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::Patients::V1::V1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Adds a patient. VersionConflictError is returned when the patient's external ID
          #  is already in use.
          #
          # @param skip_duplicate_check [Boolean]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatient, as a Hash
          #   * :name (Hash)
          #     * :family (String)
          #     * :given (Array<String>)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :race (CandidApiClient::PreEncounter::Common::Types::Race)
          #   * :ethnicity (CandidApiClient::PreEncounter::Common::Types::Ethnicity)
          #   * :disability_status (CandidApiClient::PreEncounter::Common::Types::DisabilityStatus)
          #   * :marital_status (CandidApiClient::PreEncounter::Patients::V1::Types::MaritalStatus)
          #   * :deceased (DateTime)
          #   * :multiple_birth (Integer)
          #   * :primary_address (Hash)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #     * :line (Array<String>)
          #     * :city (String)
          #     * :state (String)
          #     * :postal_code (String)
          #     * :country (String)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #   * :primary_telecom (Hash)
          #     * :value (String)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #   * :email (String)
          #   * :electronic_communication_opt_in (Boolean)
          #   * :photo (String)
          #   * :language (String)
          #   * :external_provenance (Hash)
          #     * :external_id (String)
          #     * :system_name (String)
          #   * :contacts (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Contact>)
          #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Common::Types::ExternalProvider>)
          #   * :filing_order (Hash)
          #     * :coverages (Array<String>)
          #   * :non_insurance_payers (Array<String>)
          #   * :non_insurance_payer_associations (Array<CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation>)
          #   * :guarantor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :telecom (Hash)
          #       * :value (String)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :email (String)
          #     * :birth_date (Date)
          #     * :address (Hash)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #       * :line (Array<String>)
          #       * :city (String)
          #       * :state (String)
          #       * :postal_code (String)
          #       * :country (String)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #   * :self_pay (Boolean)
          #   * :authorizations (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Authorization>)
          #   * :referrals (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Referral>)
          #   * :primary_service_facility_id (String)
          #   * :do_not_invoice_reason (CandidApiClient::PreEncounter::Patients::V1::Types::DoNotInvoiceReason)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.create(skip_duplicate_check: true, request: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, other_names: [{ family: "string", given: ["string"], use: USUAL, period: {  } }], gender: MAN, birth_date: DateTime.parse(2023-01-15), social_security_number: "string", biological_sex: FEMALE, sexual_orientation: HETEROSEXUAL, race: AMERICAN_INDIAN_OR_ALASKA_NATIVE, ethnicity: HISPANIC_OR_LATINO, disability_status: DISABLED, marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }, other_addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], primary_telecom: { value: "string", use: HOME }, other_telecoms: [{ value: "string", use: HOME }], email: "string", electronic_communication_opt_in: true, photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecoms: [{ value: "string", use: HOME }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: {  }, hipaa_authorization: true }], general_practitioners: [{ name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] }, non_insurance_payers: ["string"], non_insurance_payer_associations: [{ id: "string" }], guarantor: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecom: { value: "string", use: HOME }, email: "string", birth_date: DateTime.parse(2023-01-15), address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } } }, self_pay: true, authorizations: [{ payer_id: "string", payer_name: "string", authorization_number: "string", cpt_code: "string", units: VISIT }], referrals: [{ provider: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }, referral_number: "string" }], primary_service_facility_id: "string", do_not_invoice_reason: BANKRUPTCY })
          def create(request:, skip_duplicate_check: nil, request_options: nil)
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "skip_duplicate_check": skip_duplicate_check
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1"
            end
            CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: response.body)
          end

          # Adds a patient and hydrates their MRN with a pre-existing MRN. Once this patient
          #  is created their MRN will not be editable. BadRequestError is returned when the
          #  MRN is greater than 20 characters. VersionConflictError is returned when the
          #  patient's external ID is already in use.
          #
          # @param skip_duplicate_check [Boolean]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn, as a Hash
          #   * :mrn (String)
          #   * :name (Hash)
          #     * :family (String)
          #     * :given (Array<String>)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :race (CandidApiClient::PreEncounter::Common::Types::Race)
          #   * :ethnicity (CandidApiClient::PreEncounter::Common::Types::Ethnicity)
          #   * :disability_status (CandidApiClient::PreEncounter::Common::Types::DisabilityStatus)
          #   * :marital_status (CandidApiClient::PreEncounter::Patients::V1::Types::MaritalStatus)
          #   * :deceased (DateTime)
          #   * :multiple_birth (Integer)
          #   * :primary_address (Hash)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #     * :line (Array<String>)
          #     * :city (String)
          #     * :state (String)
          #     * :postal_code (String)
          #     * :country (String)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #   * :primary_telecom (Hash)
          #     * :value (String)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #   * :email (String)
          #   * :electronic_communication_opt_in (Boolean)
          #   * :photo (String)
          #   * :language (String)
          #   * :external_provenance (Hash)
          #     * :external_id (String)
          #     * :system_name (String)
          #   * :contacts (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Contact>)
          #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Common::Types::ExternalProvider>)
          #   * :filing_order (Hash)
          #     * :coverages (Array<String>)
          #   * :non_insurance_payers (Array<String>)
          #   * :non_insurance_payer_associations (Array<CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation>)
          #   * :guarantor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :telecom (Hash)
          #       * :value (String)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :email (String)
          #     * :birth_date (Date)
          #     * :address (Hash)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #       * :line (Array<String>)
          #       * :city (String)
          #       * :state (String)
          #       * :postal_code (String)
          #       * :country (String)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #   * :self_pay (Boolean)
          #   * :authorizations (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Authorization>)
          #   * :referrals (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Referral>)
          #   * :primary_service_facility_id (String)
          #   * :do_not_invoice_reason (CandidApiClient::PreEncounter::Patients::V1::Types::DoNotInvoiceReason)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.create_with_mrn(skip_duplicate_check: true, request: { mrn: "string", name: { family: "string", given: ["string"], use: USUAL, period: {  } }, other_names: [{ family: "string", given: ["string"], use: USUAL, period: {  } }], gender: MAN, birth_date: DateTime.parse(2023-01-15), social_security_number: "string", biological_sex: FEMALE, sexual_orientation: HETEROSEXUAL, race: AMERICAN_INDIAN_OR_ALASKA_NATIVE, ethnicity: HISPANIC_OR_LATINO, disability_status: DISABLED, marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }, other_addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], primary_telecom: { value: "string", use: HOME }, other_telecoms: [{ value: "string", use: HOME }], email: "string", electronic_communication_opt_in: true, photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecoms: [{ value: "string", use: HOME }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: {  }, hipaa_authorization: true }], general_practitioners: [{ name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] }, non_insurance_payers: ["string"], non_insurance_payer_associations: [{ id: "string" }], guarantor: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecom: { value: "string", use: HOME }, email: "string", birth_date: DateTime.parse(2023-01-15), address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } } }, self_pay: true, authorizations: [{ payer_id: "string", payer_name: "string", authorization_number: "string", cpt_code: "string", units: VISIT }], referrals: [{ provider: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }, referral_number: "string" }], primary_service_facility_id: "string", do_not_invoice_reason: BANKRUPTCY })
          def create_with_mrn(request:, skip_duplicate_check: nil, request_options: nil)
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "skip_duplicate_check": skip_duplicate_check
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1/with_mrn"
            end
            CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: response.body)
          end

          # Searches for patients that match the query parameters.
          #
          # @param limit [Integer]
          # @param mrn [String]
          # @param page_token [String]
          # @param sort_field [String]
          # @param sort_direction [CandidApiClient::PreEncounter::Common::Types::SortDirection] Defaults to ascending.
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::PatientPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.get_multi(
          #    limit: 1,
          #    mrn: "string",
          #    page_token: "string",
          #    sort_field: "string",
          #    sort_direction: ASC
          #  )
          def get_multi(limit: nil, mrn: nil, page_token: nil, sort_field: nil, sort_direction: nil,
                        request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "mrn": mrn,
                "page_token": page_token,
                "sort_field": sort_field,
                "sort_direction": sort_direction
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1/get_multi"
            end
            CandidApiClient::PreEncounter::Patients::V1::Types::PatientPage.from_json(json_object: response.body)
          end

          # Gets a patient.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.get(id: "string")
          def get(id:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1/#{id}"
            end
            CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: response.body)
          end

          # Gets a patient along with it's full history. The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.get_history(id: "string")
          def get_history(id:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1/#{id}/history"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: item)
            end
          end

          # Updates a patient. The path must contain the most recent version to prevent race
          #  conditions. Updating historic versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatient, as a Hash
          #   * :name (Hash)
          #     * :family (String)
          #     * :given (Array<String>)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :race (CandidApiClient::PreEncounter::Common::Types::Race)
          #   * :ethnicity (CandidApiClient::PreEncounter::Common::Types::Ethnicity)
          #   * :disability_status (CandidApiClient::PreEncounter::Common::Types::DisabilityStatus)
          #   * :marital_status (CandidApiClient::PreEncounter::Patients::V1::Types::MaritalStatus)
          #   * :deceased (DateTime)
          #   * :multiple_birth (Integer)
          #   * :primary_address (Hash)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #     * :line (Array<String>)
          #     * :city (String)
          #     * :state (String)
          #     * :postal_code (String)
          #     * :country (String)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #   * :primary_telecom (Hash)
          #     * :value (String)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #   * :email (String)
          #   * :electronic_communication_opt_in (Boolean)
          #   * :photo (String)
          #   * :language (String)
          #   * :external_provenance (Hash)
          #     * :external_id (String)
          #     * :system_name (String)
          #   * :contacts (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Contact>)
          #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Common::Types::ExternalProvider>)
          #   * :filing_order (Hash)
          #     * :coverages (Array<String>)
          #   * :non_insurance_payers (Array<String>)
          #   * :non_insurance_payer_associations (Array<CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation>)
          #   * :guarantor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :telecom (Hash)
          #       * :value (String)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :email (String)
          #     * :birth_date (Date)
          #     * :address (Hash)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #       * :line (Array<String>)
          #       * :city (String)
          #       * :state (String)
          #       * :postal_code (String)
          #       * :country (String)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #   * :self_pay (Boolean)
          #   * :authorizations (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Authorization>)
          #   * :referrals (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Referral>)
          #   * :primary_service_facility_id (String)
          #   * :do_not_invoice_reason (CandidApiClient::PreEncounter::Patients::V1::Types::DoNotInvoiceReason)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.update(
          #    id: "string",
          #    version: "string",
          #    request: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, other_names: [{ family: "string", given: ["string"], use: USUAL, period: {  } }], gender: MAN, birth_date: DateTime.parse(2023-01-15), social_security_number: "string", biological_sex: FEMALE, sexual_orientation: HETEROSEXUAL, race: AMERICAN_INDIAN_OR_ALASKA_NATIVE, ethnicity: HISPANIC_OR_LATINO, disability_status: DISABLED, marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }, other_addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], primary_telecom: { value: "string", use: HOME }, other_telecoms: [{ value: "string", use: HOME }], email: "string", electronic_communication_opt_in: true, photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecoms: [{ value: "string", use: HOME }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: {  }, hipaa_authorization: true }], general_practitioners: [{ name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] }, non_insurance_payers: ["string"], non_insurance_payer_associations: [{ id: "string" }], guarantor: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecom: { value: "string", use: HOME }, email: "string", birth_date: DateTime.parse(2023-01-15), address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } } }, self_pay: true, authorizations: [{ payer_id: "string", payer_name: "string", authorization_number: "string", cpt_code: "string", units: VISIT }], referrals: [{ provider: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }, referral_number: "string" }], primary_service_facility_id: "string", do_not_invoice_reason: BANKRUPTCY }
          #  )
          def update(id:, version:, request:, request_options: nil)
            response = @request_client.conn.put do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1/#{id}/#{version}"
            end
            CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: response.body)
          end

          # Sets a patient as deactivated. The path must contain the most recent version to
          #  prevent race conditions. Deactivating historic versions is not supported.
          #  Subsequent updates via PUT to the patient will "reactivate" the patient and set
          #  the deactivated flag to false.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.deactivate(id: "string", version: "string")
          def deactivate(id:, version:, request_options: nil)
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1/#{id}/#{version}"
            end
          end

          # Returns a list of Patients based on the search criteria.
          #
          # @param mrn [String]
          # @param similar_name_ordering [String] A string that is used to order similar names in search results.
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.search(mrn: "string", similar_name_ordering: "string")
          def search(mrn: nil, similar_name_ordering: nil, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "mrn": mrn,
                "similar_name_ordering": similar_name_ordering
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: item)
            end
          end

          # Scans up to 100 patient updates. The since query parameter is inclusive, and the
          #  result list is ordered by updatedAt ascending.
          #
          # @param since [DateTime]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.scan(since: DateTime.parse(2024-01-15T09:30:00.000Z))
          def scan(since:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = { **(request_options&.additional_query_parameters || {}), "since": since }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1/updates/scan"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: item)
            end
          end
        end

        class AsyncV1Client
          # @return [CandidApiClient::AsyncRequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::Patients::V1::AsyncV1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Adds a patient. VersionConflictError is returned when the patient's external ID
          #  is already in use.
          #
          # @param skip_duplicate_check [Boolean]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatient, as a Hash
          #   * :name (Hash)
          #     * :family (String)
          #     * :given (Array<String>)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :race (CandidApiClient::PreEncounter::Common::Types::Race)
          #   * :ethnicity (CandidApiClient::PreEncounter::Common::Types::Ethnicity)
          #   * :disability_status (CandidApiClient::PreEncounter::Common::Types::DisabilityStatus)
          #   * :marital_status (CandidApiClient::PreEncounter::Patients::V1::Types::MaritalStatus)
          #   * :deceased (DateTime)
          #   * :multiple_birth (Integer)
          #   * :primary_address (Hash)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #     * :line (Array<String>)
          #     * :city (String)
          #     * :state (String)
          #     * :postal_code (String)
          #     * :country (String)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #   * :primary_telecom (Hash)
          #     * :value (String)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #   * :email (String)
          #   * :electronic_communication_opt_in (Boolean)
          #   * :photo (String)
          #   * :language (String)
          #   * :external_provenance (Hash)
          #     * :external_id (String)
          #     * :system_name (String)
          #   * :contacts (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Contact>)
          #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Common::Types::ExternalProvider>)
          #   * :filing_order (Hash)
          #     * :coverages (Array<String>)
          #   * :non_insurance_payers (Array<String>)
          #   * :non_insurance_payer_associations (Array<CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation>)
          #   * :guarantor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :telecom (Hash)
          #       * :value (String)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :email (String)
          #     * :birth_date (Date)
          #     * :address (Hash)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #       * :line (Array<String>)
          #       * :city (String)
          #       * :state (String)
          #       * :postal_code (String)
          #       * :country (String)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #   * :self_pay (Boolean)
          #   * :authorizations (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Authorization>)
          #   * :referrals (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Referral>)
          #   * :primary_service_facility_id (String)
          #   * :do_not_invoice_reason (CandidApiClient::PreEncounter::Patients::V1::Types::DoNotInvoiceReason)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.create(skip_duplicate_check: true, request: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, other_names: [{ family: "string", given: ["string"], use: USUAL, period: {  } }], gender: MAN, birth_date: DateTime.parse(2023-01-15), social_security_number: "string", biological_sex: FEMALE, sexual_orientation: HETEROSEXUAL, race: AMERICAN_INDIAN_OR_ALASKA_NATIVE, ethnicity: HISPANIC_OR_LATINO, disability_status: DISABLED, marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }, other_addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], primary_telecom: { value: "string", use: HOME }, other_telecoms: [{ value: "string", use: HOME }], email: "string", electronic_communication_opt_in: true, photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecoms: [{ value: "string", use: HOME }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: {  }, hipaa_authorization: true }], general_practitioners: [{ name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] }, non_insurance_payers: ["string"], non_insurance_payer_associations: [{ id: "string" }], guarantor: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecom: { value: "string", use: HOME }, email: "string", birth_date: DateTime.parse(2023-01-15), address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } } }, self_pay: true, authorizations: [{ payer_id: "string", payer_name: "string", authorization_number: "string", cpt_code: "string", units: VISIT }], referrals: [{ provider: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }, referral_number: "string" }], primary_service_facility_id: "string", do_not_invoice_reason: BANKRUPTCY })
          def create(request:, skip_duplicate_check: nil, request_options: nil)
            Async do
              response = @request_client.conn.post do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.params = {
                  **(request_options&.additional_query_parameters || {}),
                  "skip_duplicate_check": skip_duplicate_check
                }.compact
                req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1"
              end
              CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: response.body)
            end
          end

          # Adds a patient and hydrates their MRN with a pre-existing MRN. Once this patient
          #  is created their MRN will not be editable. BadRequestError is returned when the
          #  MRN is greater than 20 characters. VersionConflictError is returned when the
          #  patient's external ID is already in use.
          #
          # @param skip_duplicate_check [Boolean]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn, as a Hash
          #   * :mrn (String)
          #   * :name (Hash)
          #     * :family (String)
          #     * :given (Array<String>)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :race (CandidApiClient::PreEncounter::Common::Types::Race)
          #   * :ethnicity (CandidApiClient::PreEncounter::Common::Types::Ethnicity)
          #   * :disability_status (CandidApiClient::PreEncounter::Common::Types::DisabilityStatus)
          #   * :marital_status (CandidApiClient::PreEncounter::Patients::V1::Types::MaritalStatus)
          #   * :deceased (DateTime)
          #   * :multiple_birth (Integer)
          #   * :primary_address (Hash)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #     * :line (Array<String>)
          #     * :city (String)
          #     * :state (String)
          #     * :postal_code (String)
          #     * :country (String)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #   * :primary_telecom (Hash)
          #     * :value (String)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #   * :email (String)
          #   * :electronic_communication_opt_in (Boolean)
          #   * :photo (String)
          #   * :language (String)
          #   * :external_provenance (Hash)
          #     * :external_id (String)
          #     * :system_name (String)
          #   * :contacts (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Contact>)
          #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Common::Types::ExternalProvider>)
          #   * :filing_order (Hash)
          #     * :coverages (Array<String>)
          #   * :non_insurance_payers (Array<String>)
          #   * :non_insurance_payer_associations (Array<CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation>)
          #   * :guarantor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :telecom (Hash)
          #       * :value (String)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :email (String)
          #     * :birth_date (Date)
          #     * :address (Hash)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #       * :line (Array<String>)
          #       * :city (String)
          #       * :state (String)
          #       * :postal_code (String)
          #       * :country (String)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #   * :self_pay (Boolean)
          #   * :authorizations (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Authorization>)
          #   * :referrals (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Referral>)
          #   * :primary_service_facility_id (String)
          #   * :do_not_invoice_reason (CandidApiClient::PreEncounter::Patients::V1::Types::DoNotInvoiceReason)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.create_with_mrn(skip_duplicate_check: true, request: { mrn: "string", name: { family: "string", given: ["string"], use: USUAL, period: {  } }, other_names: [{ family: "string", given: ["string"], use: USUAL, period: {  } }], gender: MAN, birth_date: DateTime.parse(2023-01-15), social_security_number: "string", biological_sex: FEMALE, sexual_orientation: HETEROSEXUAL, race: AMERICAN_INDIAN_OR_ALASKA_NATIVE, ethnicity: HISPANIC_OR_LATINO, disability_status: DISABLED, marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }, other_addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], primary_telecom: { value: "string", use: HOME }, other_telecoms: [{ value: "string", use: HOME }], email: "string", electronic_communication_opt_in: true, photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecoms: [{ value: "string", use: HOME }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: {  }, hipaa_authorization: true }], general_practitioners: [{ name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] }, non_insurance_payers: ["string"], non_insurance_payer_associations: [{ id: "string" }], guarantor: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecom: { value: "string", use: HOME }, email: "string", birth_date: DateTime.parse(2023-01-15), address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } } }, self_pay: true, authorizations: [{ payer_id: "string", payer_name: "string", authorization_number: "string", cpt_code: "string", units: VISIT }], referrals: [{ provider: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }, referral_number: "string" }], primary_service_facility_id: "string", do_not_invoice_reason: BANKRUPTCY })
          def create_with_mrn(request:, skip_duplicate_check: nil, request_options: nil)
            Async do
              response = @request_client.conn.post do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.params = {
                  **(request_options&.additional_query_parameters || {}),
                  "skip_duplicate_check": skip_duplicate_check
                }.compact
                req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1/with_mrn"
              end
              CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: response.body)
            end
          end

          # Searches for patients that match the query parameters.
          #
          # @param limit [Integer]
          # @param mrn [String]
          # @param page_token [String]
          # @param sort_field [String]
          # @param sort_direction [CandidApiClient::PreEncounter::Common::Types::SortDirection] Defaults to ascending.
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::PatientPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.get_multi(
          #    limit: 1,
          #    mrn: "string",
          #    page_token: "string",
          #    sort_field: "string",
          #    sort_direction: ASC
          #  )
          def get_multi(limit: nil, mrn: nil, page_token: nil, sort_field: nil, sort_direction: nil,
                        request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.params = {
                  **(request_options&.additional_query_parameters || {}),
                  "limit": limit,
                  "mrn": mrn,
                  "page_token": page_token,
                  "sort_field": sort_field,
                  "sort_direction": sort_direction
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1/get_multi"
              end
              CandidApiClient::PreEncounter::Patients::V1::Types::PatientPage.from_json(json_object: response.body)
            end
          end

          # Gets a patient.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.get(id: "string")
          def get(id:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1/#{id}"
              end
              CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: response.body)
            end
          end

          # Gets a patient along with it's full history. The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.get_history(id: "string")
          def get_history(id:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1/#{id}/history"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: item)
              end
            end
          end

          # Updates a patient. The path must contain the most recent version to prevent race
          #  conditions. Updating historic versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatient, as a Hash
          #   * :name (Hash)
          #     * :family (String)
          #     * :given (Array<String>)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :race (CandidApiClient::PreEncounter::Common::Types::Race)
          #   * :ethnicity (CandidApiClient::PreEncounter::Common::Types::Ethnicity)
          #   * :disability_status (CandidApiClient::PreEncounter::Common::Types::DisabilityStatus)
          #   * :marital_status (CandidApiClient::PreEncounter::Patients::V1::Types::MaritalStatus)
          #   * :deceased (DateTime)
          #   * :multiple_birth (Integer)
          #   * :primary_address (Hash)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #     * :line (Array<String>)
          #     * :city (String)
          #     * :state (String)
          #     * :postal_code (String)
          #     * :country (String)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #   * :primary_telecom (Hash)
          #     * :value (String)
          #     * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #   * :other_telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #   * :email (String)
          #   * :electronic_communication_opt_in (Boolean)
          #   * :photo (String)
          #   * :language (String)
          #   * :external_provenance (Hash)
          #     * :external_id (String)
          #     * :system_name (String)
          #   * :contacts (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Contact>)
          #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Common::Types::ExternalProvider>)
          #   * :filing_order (Hash)
          #     * :coverages (Array<String>)
          #   * :non_insurance_payers (Array<String>)
          #   * :non_insurance_payer_associations (Array<CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation>)
          #   * :guarantor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :telecom (Hash)
          #       * :value (String)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::ContactPointUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :email (String)
          #     * :birth_date (Date)
          #     * :address (Hash)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::AddressUse)
          #       * :line (Array<String>)
          #       * :city (String)
          #       * :state (String)
          #       * :postal_code (String)
          #       * :country (String)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #   * :self_pay (Boolean)
          #   * :authorizations (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Authorization>)
          #   * :referrals (Array<CandidApiClient::PreEncounter::Patients::V1::Types::Referral>)
          #   * :primary_service_facility_id (String)
          #   * :do_not_invoice_reason (CandidApiClient::PreEncounter::Patients::V1::Types::DoNotInvoiceReason)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.update(
          #    id: "string",
          #    version: "string",
          #    request: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, other_names: [{ family: "string", given: ["string"], use: USUAL, period: {  } }], gender: MAN, birth_date: DateTime.parse(2023-01-15), social_security_number: "string", biological_sex: FEMALE, sexual_orientation: HETEROSEXUAL, race: AMERICAN_INDIAN_OR_ALASKA_NATIVE, ethnicity: HISPANIC_OR_LATINO, disability_status: DISABLED, marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }, other_addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], primary_telecom: { value: "string", use: HOME }, other_telecoms: [{ value: "string", use: HOME }], email: "string", electronic_communication_opt_in: true, photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecoms: [{ value: "string", use: HOME }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: {  }, hipaa_authorization: true }], general_practitioners: [{ name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] }, non_insurance_payers: ["string"], non_insurance_payer_associations: [{ id: "string" }], guarantor: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecom: { value: "string", use: HOME }, email: "string", birth_date: DateTime.parse(2023-01-15), address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } } }, self_pay: true, authorizations: [{ payer_id: "string", payer_name: "string", authorization_number: "string", cpt_code: "string", units: VISIT }], referrals: [{ provider: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME }], addresses: , period: {  }, canonical_id: "string" }, referral_number: "string" }], primary_service_facility_id: "string", do_not_invoice_reason: BANKRUPTCY }
          #  )
          def update(id:, version:, request:, request_options: nil)
            Async do
              response = @request_client.conn.put do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1/#{id}/#{version}"
              end
              CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: response.body)
            end
          end

          # Sets a patient as deactivated. The path must contain the most recent version to
          #  prevent race conditions. Deactivating historic versions is not supported.
          #  Subsequent updates via PUT to the patient will "reactivate" the patient and set
          #  the deactivated flag to false.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.deactivate(id: "string", version: "string")
          def deactivate(id:, version:, request_options: nil)
            Async do
              @request_client.conn.delete do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1/#{id}/#{version}"
              end
            end
          end

          # Returns a list of Patients based on the search criteria.
          #
          # @param mrn [String]
          # @param similar_name_ordering [String] A string that is used to order similar names in search results.
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.search(mrn: "string", similar_name_ordering: "string")
          def search(mrn: nil, similar_name_ordering: nil, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.params = {
                  **(request_options&.additional_query_parameters || {}),
                  "mrn": mrn,
                  "similar_name_ordering": similar_name_ordering
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: item)
              end
            end
          end

          # Scans up to 100 patient updates. The since query parameter is inclusive, and the
          #  result list is ordered by updatedAt ascending.
          #
          # @param since [DateTime]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.scan(since: DateTime.parse(2024-01-15T09:30:00.000Z))
          def scan(since:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.params = { **(request_options&.additional_query_parameters || {}), "since": since }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1/updates/scan"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: item)
              end
            end
          end
        end
      end
    end
  end
end
