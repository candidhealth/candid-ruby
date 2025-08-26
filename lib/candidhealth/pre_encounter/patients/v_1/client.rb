# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/mutable_patient"
require_relative "types/patient"
require_relative "types/mutable_patient_with_mrn"
require_relative "../../common/types/sort_direction"
require_relative "types/patient_page"
require_relative "../../common/types/external_provider"
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

          # Adds a patient.  VersionConflictError is returned when the patient's external ID
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
          #     * :suffix (String)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :other_identifiers (Array<CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :pronouns (Array<String>)
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
          #       * :suffix (String)
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
          #   * :note_ids (Array<String>)
          #   * :tag_ids (Array<String>)
          #   * :origination_detail (Hash)
          #     * :referral_source (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralSource)
          #     * :referring_provider (Hash)
          #       * :name (Hash)
          #         * :family (String)
          #         * :given (Array<String>)
          #         * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #         * :period (Hash)
          #           * :start (Date)
          #           * :end_ (Date)
          #         * :suffix (String)
          #       * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #       * :npi (String)
          #       * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #       * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :canonical_id (String)
          #       * :fax (String)
          #     * :specialization_categories (Array<CandidApiClient::PreEncounter::Patients::V1::Types::SpecializationCategory>)
          #     * :referral_type (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralType)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.create(request: { name: { family: "family", given: ["given", "given"], use: USUAL }, other_names: [{ family: "family", given: ["given", "given"], use: USUAL }, { family: "family", given: ["given", "given"], use: USUAL }], birth_date: DateTime.parse(2023-01-15), biological_sex: FEMALE, primary_address: { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, other_addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }], primary_telecom: { value: "value", use: HOME }, other_telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], contacts: [{ relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }, { relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }], general_practitioners: [{ name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }, { name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] } })
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

          # Adds a patient and hydrates their MRN with a pre-existing MRN.  Once this
          #  patient is created their MRN will not be editable. BadRequestError is returned
          #  when the MRN is greater than 20 characters. VersionConflictError is returned
          #  when the patient's external ID is already in use.
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
          #     * :suffix (String)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :other_identifiers (Array<CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :pronouns (Array<String>)
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
          #       * :suffix (String)
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
          #   * :note_ids (Array<String>)
          #   * :tag_ids (Array<String>)
          #   * :origination_detail (Hash)
          #     * :referral_source (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralSource)
          #     * :referring_provider (Hash)
          #       * :name (Hash)
          #         * :family (String)
          #         * :given (Array<String>)
          #         * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #         * :period (Hash)
          #           * :start (Date)
          #           * :end_ (Date)
          #         * :suffix (String)
          #       * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #       * :npi (String)
          #       * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #       * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :canonical_id (String)
          #       * :fax (String)
          #     * :specialization_categories (Array<CandidApiClient::PreEncounter::Patients::V1::Types::SpecializationCategory>)
          #     * :referral_type (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralType)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.create_with_mrn(request: { name: { family: "family", given: ["given", "given"], use: USUAL }, other_names: [{ family: "family", given: ["given", "given"], use: USUAL }, { family: "family", given: ["given", "given"], use: USUAL }], birth_date: DateTime.parse(2023-01-15), biological_sex: FEMALE, primary_address: { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, other_addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }], primary_telecom: { value: "value", use: HOME }, other_telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], contacts: [{ relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }, { relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }], general_practitioners: [{ name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }, { name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] }, mrn: "mrn" })
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
          #  api.pre_encounter.patients.v_1.get_multi
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

          # Searches for referring providers that match the query parameters.  The search is
          #  case-insensitive, supports fuzzy matching, and matches against provider name and
          #  NPI. The search criteria must be an alphanumeric string, and the search is
          #  limited to the first 20 results.
          #
          # @param search_criteria [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Common::Types::ExternalProvider>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.search_providers(search_criteria: "search_criteria")
          def search_providers(search_criteria:, request_options: nil)
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
                "search_criteria": search_criteria
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1/search_providers"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Common::Types::ExternalProvider.from_json(json_object: item)
            end
          end

          # Gets a patient.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.get(id: "id")
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

          # Gets a patient along with it's full history.  The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.get_history(id: "id")
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

          # Updates a patient. The path must contain the next version number to prevent race
          #  conditions. For example, if the current version of the patient is n, you will
          #  need to send a request to this endpoint with `/{id}/n+1` to update the patient.
          #  Updating historic versions is not supported.
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
          #     * :suffix (String)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :other_identifiers (Array<CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :pronouns (Array<String>)
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
          #       * :suffix (String)
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
          #   * :note_ids (Array<String>)
          #   * :tag_ids (Array<String>)
          #   * :origination_detail (Hash)
          #     * :referral_source (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralSource)
          #     * :referring_provider (Hash)
          #       * :name (Hash)
          #         * :family (String)
          #         * :given (Array<String>)
          #         * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #         * :period (Hash)
          #           * :start (Date)
          #           * :end_ (Date)
          #         * :suffix (String)
          #       * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #       * :npi (String)
          #       * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #       * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :canonical_id (String)
          #       * :fax (String)
          #     * :specialization_categories (Array<CandidApiClient::PreEncounter::Patients::V1::Types::SpecializationCategory>)
          #     * :referral_type (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralType)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.update(
          #    id: "id",
          #    version: "version",
          #    request: { name: { family: "family", given: ["given", "given"], use: USUAL }, other_names: [{ family: "family", given: ["given", "given"], use: USUAL }, { family: "family", given: ["given", "given"], use: USUAL }], birth_date: DateTime.parse(2023-01-15), biological_sex: FEMALE, primary_address: { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, other_addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }], primary_telecom: { value: "value", use: HOME }, other_telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], contacts: [{ relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }, { relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }], general_practitioners: [{ name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }, { name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] } }
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

          # Sets a patient as deactivated.  The path must contain the most recent version
          #  plus 1 to prevent race conditions.  Deactivating historic versions is not
          #  supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.deactivate(id: "id", version: "version")
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

          # Removes the deactivated flag for a patient.  The path must contain the most
          #  recent version plus 1 to prevent race conditions.  Reactivating historic
          #  versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.reactivate(id: "id", version: "version")
          def reactivate(id:, version:, request_options: nil)
            @request_client.conn.patch do |req|
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
          #  api.pre_encounter.patients.v_1.search
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

          # Scans up to 100 patient updates.  The since query parameter is inclusive, and
          #  the result list is ordered by updatedAt ascending.
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

          # Adds a patient.  VersionConflictError is returned when the patient's external ID
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
          #     * :suffix (String)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :other_identifiers (Array<CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :pronouns (Array<String>)
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
          #       * :suffix (String)
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
          #   * :note_ids (Array<String>)
          #   * :tag_ids (Array<String>)
          #   * :origination_detail (Hash)
          #     * :referral_source (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralSource)
          #     * :referring_provider (Hash)
          #       * :name (Hash)
          #         * :family (String)
          #         * :given (Array<String>)
          #         * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #         * :period (Hash)
          #           * :start (Date)
          #           * :end_ (Date)
          #         * :suffix (String)
          #       * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #       * :npi (String)
          #       * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #       * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :canonical_id (String)
          #       * :fax (String)
          #     * :specialization_categories (Array<CandidApiClient::PreEncounter::Patients::V1::Types::SpecializationCategory>)
          #     * :referral_type (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralType)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.create(request: { name: { family: "family", given: ["given", "given"], use: USUAL }, other_names: [{ family: "family", given: ["given", "given"], use: USUAL }, { family: "family", given: ["given", "given"], use: USUAL }], birth_date: DateTime.parse(2023-01-15), biological_sex: FEMALE, primary_address: { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, other_addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }], primary_telecom: { value: "value", use: HOME }, other_telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], contacts: [{ relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }, { relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }], general_practitioners: [{ name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }, { name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] } })
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

          # Adds a patient and hydrates their MRN with a pre-existing MRN.  Once this
          #  patient is created their MRN will not be editable. BadRequestError is returned
          #  when the MRN is greater than 20 characters. VersionConflictError is returned
          #  when the patient's external ID is already in use.
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
          #     * :suffix (String)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :other_identifiers (Array<CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :pronouns (Array<String>)
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
          #       * :suffix (String)
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
          #   * :note_ids (Array<String>)
          #   * :tag_ids (Array<String>)
          #   * :origination_detail (Hash)
          #     * :referral_source (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralSource)
          #     * :referring_provider (Hash)
          #       * :name (Hash)
          #         * :family (String)
          #         * :given (Array<String>)
          #         * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #         * :period (Hash)
          #           * :start (Date)
          #           * :end_ (Date)
          #         * :suffix (String)
          #       * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #       * :npi (String)
          #       * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #       * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :canonical_id (String)
          #       * :fax (String)
          #     * :specialization_categories (Array<CandidApiClient::PreEncounter::Patients::V1::Types::SpecializationCategory>)
          #     * :referral_type (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralType)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.create_with_mrn(request: { name: { family: "family", given: ["given", "given"], use: USUAL }, other_names: [{ family: "family", given: ["given", "given"], use: USUAL }, { family: "family", given: ["given", "given"], use: USUAL }], birth_date: DateTime.parse(2023-01-15), biological_sex: FEMALE, primary_address: { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, other_addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }], primary_telecom: { value: "value", use: HOME }, other_telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], contacts: [{ relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }, { relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }], general_practitioners: [{ name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }, { name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] }, mrn: "mrn" })
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
          #  api.pre_encounter.patients.v_1.get_multi
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

          # Searches for referring providers that match the query parameters.  The search is
          #  case-insensitive, supports fuzzy matching, and matches against provider name and
          #  NPI. The search criteria must be an alphanumeric string, and the search is
          #  limited to the first 20 results.
          #
          # @param search_criteria [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Common::Types::ExternalProvider>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.search_providers(search_criteria: "search_criteria")
          def search_providers(search_criteria:, request_options: nil)
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
                  "search_criteria": search_criteria
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1/search_providers"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Common::Types::ExternalProvider.from_json(json_object: item)
              end
            end
          end

          # Gets a patient.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.get(id: "id")
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

          # Gets a patient along with it's full history.  The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.get_history(id: "id")
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

          # Updates a patient. The path must contain the next version number to prevent race
          #  conditions. For example, if the current version of the patient is n, you will
          #  need to send a request to this endpoint with `/{id}/n+1` to update the patient.
          #  Updating historic versions is not supported.
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
          #     * :suffix (String)
          #   * :other_names (Array<CandidApiClient::PreEncounter::Common::Types::HumanName>)
          #   * :other_identifiers (Array<CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier>)
          #   * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :birth_date (Date)
          #   * :social_security_number (String)
          #   * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
          #   * :sexual_orientation (CandidApiClient::PreEncounter::Common::Types::SexualOrientation)
          #   * :pronouns (Array<String>)
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
          #       * :suffix (String)
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
          #   * :note_ids (Array<String>)
          #   * :tag_ids (Array<String>)
          #   * :origination_detail (Hash)
          #     * :referral_source (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralSource)
          #     * :referring_provider (Hash)
          #       * :name (Hash)
          #         * :family (String)
          #         * :given (Array<String>)
          #         * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #         * :period (Hash)
          #           * :start (Date)
          #           * :end_ (Date)
          #         * :suffix (String)
          #       * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #       * :npi (String)
          #       * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #       * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :canonical_id (String)
          #       * :fax (String)
          #     * :specialization_categories (Array<CandidApiClient::PreEncounter::Patients::V1::Types::SpecializationCategory>)
          #     * :referral_type (CandidApiClient::PreEncounter::Patients::V1::Types::ReferralType)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.update(
          #    id: "id",
          #    version: "version",
          #    request: { name: { family: "family", given: ["given", "given"], use: USUAL }, other_names: [{ family: "family", given: ["given", "given"], use: USUAL }, { family: "family", given: ["given", "given"], use: USUAL }], birth_date: DateTime.parse(2023-01-15), biological_sex: FEMALE, primary_address: { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, other_addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }], primary_telecom: { value: "value", use: HOME }, other_telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], contacts: [{ relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }, { relationship: [SELF, SELF], name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }], addresses: [{ use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }, { use: HOME, line: ["line", "line"], city: "city", state: "state", postal_code: "postal_code", country: "country" }] }], general_practitioners: [{ name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }, { name: { family: "family", given: ["given", "given"], use: USUAL }, telecoms: [{ value: "value", use: HOME }, { value: "value", use: HOME }] }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] } }
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

          # Sets a patient as deactivated.  The path must contain the most recent version
          #  plus 1 to prevent race conditions.  Deactivating historic versions is not
          #  supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.deactivate(id: "id", version: "version")
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

          # Removes the deactivated flag for a patient.  The path must contain the most
          #  recent version plus 1 to prevent race conditions.  Reactivating historic
          #  versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.patients.v_1.reactivate(id: "id", version: "version")
          def reactivate(id:, version:, request_options: nil)
            Async do
              @request_client.conn.patch do |req|
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
          #  api.pre_encounter.patients.v_1.search
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

          # Scans up to 100 patient updates.  The since query parameter is inclusive, and
          #  the result list is ordered by updatedAt ascending.
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
