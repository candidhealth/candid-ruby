# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/mutable_patient"
require_relative "types/patient"
require "json"
require "date"
require "async"

module CandidApiClient
  module PreEncounter
    class PatientsClient
      # @return [CandidApiClient::RequestClient]
      attr_reader :request_client

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::PreEncounter::PatientsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Adds a patient. VersionConflictError is returned when the patient's external ID
      #  is already in use.
      #
      # @param request [Hash] Request of type CandidApiClient::PreEncounter::Patients::Types::MutablePatient, as a Hash
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
      #   * :marital_status (CandidApiClient::PreEncounter::Patients::Types::MaritalStatus)
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
      #   * :photo (String)
      #   * :language (String)
      #   * :external_provenance (Hash)
      #     * :external_id (String)
      #     * :system_name (String)
      #   * :contacts (Array<CandidApiClient::PreEncounter::Patients::Types::Contact>)
      #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Patients::Types::ExternalProvider>)
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [CandidApiClient::PreEncounter::Patients::Types::Patient]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.create(request: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, other_names: [{ family: "string", given: ["string"], use: USUAL, period: {  } }], gender: FEMALE, birth_date: DateTime.parse(2023-01-15), marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }, other_addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], primary_telecom: { value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }, other_telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: { family: "string", given: ["string"], use: USUAL, period: {  } }, gender: FEMALE, telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], general_practitioners: [{ name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }] })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/patients"
        end
        CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: response.body)
      end

      # Gets a patient.
      #
      # @param id [String]
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [CandidApiClient::PreEncounter::Patients::Types::Patient]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.get(id: "string")
      def get(id:, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/patients/#{id}"
        end
        CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: response.body)
      end

      # Gets a patient along with it's full history. The return list is ordered by
      #  version ascending.
      #
      # @param id [String]
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [Array<CandidApiClient::PreEncounter::Patients::Types::Patient>]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.get_history(id: "string")
      def get_history(id:, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/patients/#{id}/history"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: item)
        end
      end

      # Updates a patient. The path must contain the most recent version to prevent
      #  races. Updating historic versions is not supported.
      #
      # @param id [String]
      # @param version [Integer]
      # @param request [Hash] Request of type CandidApiClient::PreEncounter::Patients::Types::MutablePatient, as a Hash
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
      #   * :marital_status (CandidApiClient::PreEncounter::Patients::Types::MaritalStatus)
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
      #   * :photo (String)
      #   * :language (String)
      #   * :external_provenance (Hash)
      #     * :external_id (String)
      #     * :system_name (String)
      #   * :contacts (Array<CandidApiClient::PreEncounter::Patients::Types::Contact>)
      #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Patients::Types::ExternalProvider>)
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [CandidApiClient::PreEncounter::Patients::Types::Patient]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.update(
      #    id: "string",
      #    version: 1,
      #    request: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, other_names: [{ family: "string", given: ["string"], use: USUAL, period: {  } }], gender: FEMALE, birth_date: DateTime.parse(2023-01-15), marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }, other_addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], primary_telecom: { value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }, other_telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: { family: "string", given: ["string"], use: USUAL, period: {  } }, gender: FEMALE, telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], general_practitioners: [{ name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }] }
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
          req.url "#{@request_client.get_url(request_options: request_options)}/patients/#{id}/#{version}"
        end
        CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: response.body)
      end

      # Sets a patient as deactivated. The path must contain the most recent version to
      #  prevent races. Dactivating historic versions is not supported. Subsequent
      #  updates via PUT to the patient will "reactivate" the patient and set the
      #  deactivated flag to false.
      #
      # @param id [String]
      # @param version [Integer]
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [Void]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.deactivate(id: "string", version: 1)
      def deactivate(id:, version:, request_options: nil)
        @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/patients/#{id}/#{version}"
        end
      end

      # Searches for patients that match the query parameters.
      #
      # @param name_contains [String]
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [Array<CandidApiClient::PreEncounter::Patients::Types::Patient>]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.search(name_contains: "string")
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
            "name-contains": name_contains
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/patients"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: item)
        end
      end

      # Scans up to 100 patient updates. The since query parameter is inclusive, and the
      #  result list is ordered by updatedAt descending.
      #
      # @param since [DateTime]
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [Array<CandidApiClient::PreEncounter::Patients::Types::Patient>]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.scan(since: DateTime.parse(2024-01-15T09:30:00.000Z))
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
          req.url "#{@request_client.get_url(request_options: request_options)}/patients/updates/scan"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: item)
        end
      end
    end

    class AsyncPatientsClient
      # @return [CandidApiClient::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::PreEncounter::AsyncPatientsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Adds a patient. VersionConflictError is returned when the patient's external ID
      #  is already in use.
      #
      # @param request [Hash] Request of type CandidApiClient::PreEncounter::Patients::Types::MutablePatient, as a Hash
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
      #   * :marital_status (CandidApiClient::PreEncounter::Patients::Types::MaritalStatus)
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
      #   * :photo (String)
      #   * :language (String)
      #   * :external_provenance (Hash)
      #     * :external_id (String)
      #     * :system_name (String)
      #   * :contacts (Array<CandidApiClient::PreEncounter::Patients::Types::Contact>)
      #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Patients::Types::ExternalProvider>)
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [CandidApiClient::PreEncounter::Patients::Types::Patient]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.create(request: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, other_names: [{ family: "string", given: ["string"], use: USUAL, period: {  } }], gender: FEMALE, birth_date: DateTime.parse(2023-01-15), marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }, other_addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], primary_telecom: { value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }, other_telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: { family: "string", given: ["string"], use: USUAL, period: {  } }, gender: FEMALE, telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], general_practitioners: [{ name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }] })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/patients"
          end
          CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: response.body)
        end
      end

      # Gets a patient.
      #
      # @param id [String]
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [CandidApiClient::PreEncounter::Patients::Types::Patient]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.get(id: "string")
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
            req.url "#{@request_client.get_url(request_options: request_options)}/patients/#{id}"
          end
          CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: response.body)
        end
      end

      # Gets a patient along with it's full history. The return list is ordered by
      #  version ascending.
      #
      # @param id [String]
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [Array<CandidApiClient::PreEncounter::Patients::Types::Patient>]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.get_history(id: "string")
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
            req.url "#{@request_client.get_url(request_options: request_options)}/patients/#{id}/history"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: item)
          end
        end
      end

      # Updates a patient. The path must contain the most recent version to prevent
      #  races. Updating historic versions is not supported.
      #
      # @param id [String]
      # @param version [Integer]
      # @param request [Hash] Request of type CandidApiClient::PreEncounter::Patients::Types::MutablePatient, as a Hash
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
      #   * :marital_status (CandidApiClient::PreEncounter::Patients::Types::MaritalStatus)
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
      #   * :photo (String)
      #   * :language (String)
      #   * :external_provenance (Hash)
      #     * :external_id (String)
      #     * :system_name (String)
      #   * :contacts (Array<CandidApiClient::PreEncounter::Patients::Types::Contact>)
      #   * :general_practitioners (Array<CandidApiClient::PreEncounter::Patients::Types::ExternalProvider>)
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [CandidApiClient::PreEncounter::Patients::Types::Patient]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.update(
      #    id: "string",
      #    version: 1,
      #    request: { name: { family: "string", given: ["string"], use: USUAL, period: {  } }, other_names: [{ family: "string", given: ["string"], use: USUAL, period: {  } }], gender: FEMALE, birth_date: DateTime.parse(2023-01-15), marital_status: ANNULLED, deceased: DateTime.parse(2024-01-15T09:30:00.000Z), multiple_birth: 1, primary_address: { use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }, other_addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], primary_telecom: { value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }, other_telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], photo: "string", language: "string", external_provenance: { external_id: "string", system_name: "string" }, contacts: [{ relationship: [SELF], name: { family: "string", given: ["string"], use: USUAL, period: {  } }, gender: FEMALE, telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], general_practitioners: [{ name: { family: "string", given: ["string"], use: USUAL, period: {  } }, telecoms: [{ value: "string", use: HOME, period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }], addresses: [{ use: HOME, line: ["string"], city: "string", state: "string", postal_code: "string", country: "string", period: {  } }], period: { start: DateTime.parse(2023-01-15), end_: DateTime.parse(2023-01-15) } }] }
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
            req.url "#{@request_client.get_url(request_options: request_options)}/patients/#{id}/#{version}"
          end
          CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: response.body)
        end
      end

      # Sets a patient as deactivated. The path must contain the most recent version to
      #  prevent races. Dactivating historic versions is not supported. Subsequent
      #  updates via PUT to the patient will "reactivate" the patient and set the
      #  deactivated flag to false.
      #
      # @param id [String]
      # @param version [Integer]
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [Void]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.deactivate(id: "string", version: 1)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/patients/#{id}/#{version}"
          end
        end
      end

      # Searches for patients that match the query parameters.
      #
      # @param name_contains [String]
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [Array<CandidApiClient::PreEncounter::Patients::Types::Patient>]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.search(name_contains: "string")
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
              "name-contains": name_contains
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/patients"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: item)
          end
        end
      end

      # Scans up to 100 patient updates. The since query parameter is inclusive, and the
      #  result list is ordered by updatedAt descending.
      #
      # @param since [DateTime]
      # @param request_options [CandidApiClient::RequestOptions]
      # @return [Array<CandidApiClient::PreEncounter::Patients::Types::Patient>]
      # @example
      #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
      #  api.pre_encounter.patients.scan(since: DateTime.parse(2024-01-15T09:30:00.000Z))
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
            req.url "#{@request_client.get_url(request_options: request_options)}/patients/updates/scan"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            CandidApiClient::PreEncounter::Patients::Types::Patient.from_json(json_object: item)
          end
        end
      end
    end
  end
end
