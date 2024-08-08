# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/mutable_patient"
require_relative "types/patient"
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
          #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvider>)
          #   * :filing_order (Hash)
          #     * :coverages (Array<String>)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.patients.v_1.create(request: { name: {  }, other_names: [{  }], gender: MAN, birth_date: DateTime.parse(2023-01-15), social_security_number: "string", biological_sex: FEMALE, sexual_orientation: HETEROSEXUAL, race: AMERICAN_INDIAN_OR_ALASKA_NATIVE, ethnicity: HISPANIC_OR_LATINO, disability_status: DISABLED, marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: {  }, other_addresses: [{  }], primary_telecom: {  }, other_telecoms: [{  }], email: "string", electronic_communication_opt_in: true, photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: {  }, gender: MAN, telecoms: [{  }], addresses: [{  }], period: {  } }], general_practitioners: [{ name: {  }, npi: "string", telecoms: [{  }], addresses: [{  }], period: {  } }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] } })
          def create(request:, request_options: nil)
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/patients/v1"
            end
            CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: response.body)
          end

          # Gets a patient.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
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
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
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

          # Updates a patient. The path must contain the most recent version to prevent
          #  races. Updating historic versions is not supported.
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
          #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvider>)
          #   * :filing_order (Hash)
          #     * :coverages (Array<String>)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.patients.v_1.update(
          #    id: "string",
          #    version: "string",
          #    request: { name: {  }, other_names: [{  }], gender: MAN, birth_date: DateTime.parse(2023-01-15), social_security_number: "string", biological_sex: FEMALE, sexual_orientation: HETEROSEXUAL, race: AMERICAN_INDIAN_OR_ALASKA_NATIVE, ethnicity: HISPANIC_OR_LATINO, disability_status: DISABLED, marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: {  }, other_addresses: [{  }], primary_telecom: {  }, other_telecoms: [{  }], email: "string", electronic_communication_opt_in: true, photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: {  }, gender: MAN, telecoms: [{  }], addresses: [{  }], period: {  } }], general_practitioners: [{ name: {  }, npi: "string", telecoms: [{  }], addresses: [{  }], period: {  } }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] } }
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
          #  prevent races. Dactivating historic versions is not supported. Subsequent
          #  updates via PUT to the patient will "reactivate" the patient and set the
          #  deactivated flag to false.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
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

          # Searches for patients that match the query parameters.
          #
          # @param name_contains [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.patients.v_1.search(name_contains: "string")
          def search(name_contains: nil, request_options: nil)
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
                "name_contains": name_contains
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
          #  result list is ordered by updatedAt descending.
          #
          # @param since [DateTime]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
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
          #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvider>)
          #   * :filing_order (Hash)
          #     * :coverages (Array<String>)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.patients.v_1.create(request: { name: {  }, other_names: [{  }], gender: MAN, birth_date: DateTime.parse(2023-01-15), social_security_number: "string", biological_sex: FEMALE, sexual_orientation: HETEROSEXUAL, race: AMERICAN_INDIAN_OR_ALASKA_NATIVE, ethnicity: HISPANIC_OR_LATINO, disability_status: DISABLED, marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: {  }, other_addresses: [{  }], primary_telecom: {  }, other_telecoms: [{  }], email: "string", electronic_communication_opt_in: true, photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: {  }, gender: MAN, telecoms: [{  }], addresses: [{  }], period: {  } }], general_practitioners: [{ name: {  }, npi: "string", telecoms: [{  }], addresses: [{  }], period: {  } }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] } })
          def create(request:, request_options: nil)
            Async do
              response = @request_client.conn.post do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/patients/v1"
              end
              CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: response.body)
            end
          end

          # Gets a patient.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
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
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
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

          # Updates a patient. The path must contain the most recent version to prevent
          #  races. Updating historic versions is not supported.
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
          #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvider>)
          #   * :filing_order (Hash)
          #     * :coverages (Array<String>)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.patients.v_1.update(
          #    id: "string",
          #    version: "string",
          #    request: { name: {  }, other_names: [{  }], gender: MAN, birth_date: DateTime.parse(2023-01-15), social_security_number: "string", biological_sex: FEMALE, sexual_orientation: HETEROSEXUAL, race: AMERICAN_INDIAN_OR_ALASKA_NATIVE, ethnicity: HISPANIC_OR_LATINO, disability_status: DISABLED, marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: {  }, other_addresses: [{  }], primary_telecom: {  }, other_telecoms: [{  }], email: "string", electronic_communication_opt_in: true, photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: {  }, gender: MAN, telecoms: [{  }], addresses: [{  }], period: {  } }], general_practitioners: [{ name: {  }, npi: "string", telecoms: [{  }], addresses: [{  }], period: {  } }], filing_order: { coverages: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"] } }
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
          #  prevent races. Dactivating historic versions is not supported. Subsequent
          #  updates via PUT to the patient will "reactivate" the patient and set the
          #  deactivated flag to false.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
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

          # Searches for patients that match the query parameters.
          #
          # @param name_contains [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.patients.v_1.search(name_contains: "string")
          def search(name_contains: nil, request_options: nil)
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
                  "name_contains": name_contains
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
          #  result list is ordered by updatedAt descending.
          #
          # @param since [DateTime]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Patient>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
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
