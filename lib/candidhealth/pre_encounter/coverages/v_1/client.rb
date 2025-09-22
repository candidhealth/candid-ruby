# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/mutable_coverage"
require_relative "types/coverage"
require_relative "types/coverages_page"
require "json"
require "date"
require_relative "types/payer_plan_group_fields"
require_relative "types/service_type_code"
require_relative "../../eligibility_checks/v_1/types/eligibility_check_metadata"
require_relative "types/coverage_eligibility_check_response"
require "async"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        class V1Client
          # @return [CandidApiClient::RequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::V1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Creates a new Coverage. A Coverage provides the high-level identifiers and
          #  descriptors of a specific insurance plan for a specific individual - typically
          #  the information you can find on an insurance card. Additionally a coverage will
          #  include detailed benefits information covered by the specific plan for the
          #  individual.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage, as a Hash
          #   * :status (CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus)
          #   * :subscriber (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :suffix (String)
          #     * :date_of_birth (Date)
          #     * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
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
          #   * :relationship (CandidApiClient::PreEncounter::Common::Types::Relationship)
          #   * :patient (String)
          #   * :insurance_plan (Hash)
          #     * :member_id (String)
          #     * :payer_id (String)
          #     * :payer_name (String)
          #     * :additional_payer_information (Hash)
          #       * :availity_eligibility_id (String)
          #       * :availity_payer_id (String)
          #       * :availity_payer_name (String)
          #       * :availity_remittance_payer_id (String)
          #     * :group_number (String)
          #     * :name (String)
          #     * :plan_type (CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType)
          #     * :type (CandidApiClient::PreEncounter::Coverages::V1::Types::InsuranceTypeCode)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :insurance_card_image_locator (String)
          #     * :payer_plan_group_id (String)
          #   * :verified (Boolean)
          #   * :eligibility_checks (Array<CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata>)
          #   * :latest_eligibility_check (Hash)
          #     * :check_id (String)
          #     * :status (CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus)
          #     * :initiated_at (DateTime)
          #   * :benefits (Hash)
          #     * :plan_coverage (Hash)
          #       * :in_network (Hash)
          #         * :deductible (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :additional_notes (String)
          #       * :in_network_flat (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>)
          #       * :out_of_network (Hash)
          #         * :deductible (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :additional_notes (String)
          #       * :out_of_network_flat (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>)
          #     * :service_specific_coverage (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverage>)
          #     * :benefits_related_entities (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::BenefitsRelatedEntity>)
          #     * :notes (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.create(request: { status: ACTIVE, subscriber: { name: { family: "family", given: ["given", "given"], use: USUAL }, biological_sex: FEMALE }, relationship: SELF, patient: "patient", insurance_plan: { member_id: "member_id", payer_id: "payer_id", payer_name: "payer_name" }, verified: true })
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
                                                 request_options: request_options)}/coverages/v1"
            end
            CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
          end

          # Updates a Coverage. The path must contain the next version number to prevent
          #  race conditions. For example, if the current version of the coverage is n, you
          #  will need to send a request to this endpoint with `/{id}/n+1` to update the
          #  coverage. Updating historic versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage, as a Hash
          #   * :status (CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus)
          #   * :subscriber (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :suffix (String)
          #     * :date_of_birth (Date)
          #     * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
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
          #   * :relationship (CandidApiClient::PreEncounter::Common::Types::Relationship)
          #   * :patient (String)
          #   * :insurance_plan (Hash)
          #     * :member_id (String)
          #     * :payer_id (String)
          #     * :payer_name (String)
          #     * :additional_payer_information (Hash)
          #       * :availity_eligibility_id (String)
          #       * :availity_payer_id (String)
          #       * :availity_payer_name (String)
          #       * :availity_remittance_payer_id (String)
          #     * :group_number (String)
          #     * :name (String)
          #     * :plan_type (CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType)
          #     * :type (CandidApiClient::PreEncounter::Coverages::V1::Types::InsuranceTypeCode)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :insurance_card_image_locator (String)
          #     * :payer_plan_group_id (String)
          #   * :verified (Boolean)
          #   * :eligibility_checks (Array<CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata>)
          #   * :latest_eligibility_check (Hash)
          #     * :check_id (String)
          #     * :status (CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus)
          #     * :initiated_at (DateTime)
          #   * :benefits (Hash)
          #     * :plan_coverage (Hash)
          #       * :in_network (Hash)
          #         * :deductible (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :additional_notes (String)
          #       * :in_network_flat (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>)
          #       * :out_of_network (Hash)
          #         * :deductible (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :additional_notes (String)
          #       * :out_of_network_flat (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>)
          #     * :service_specific_coverage (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverage>)
          #     * :benefits_related_entities (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::BenefitsRelatedEntity>)
          #     * :notes (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.update(
          #    id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
          #    version: "version",
          #    request: { status: ACTIVE, subscriber: { name: { family: "family", given: ["given", "given"], use: USUAL }, biological_sex: FEMALE }, relationship: SELF, patient: "patient", insurance_plan: { member_id: "member_id", payer_id: "payer_id", payer_name: "payer_name" }, verified: true }
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
                                                 request_options: request_options)}/coverages/v1/#{id}/#{version}"
            end
            CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
          end

          # Returns a page of Coverages based on the search criteria.
          #
          # @param patient_id [String]
          # @param payer_plan_group_id [String]
          # @param page_token [String]
          # @param limit [Integer] Must be between 0 and 1000. Defaults to 100
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoveragesPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.get_multi_paginated
          def get_multi_paginated(patient_id: nil, payer_plan_group_id: nil, page_token: nil, limit: nil,
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
                "patient_id": patient_id,
                "payer_plan_group_id": payer_plan_group_id,
                "page_token": page_token,
                "limit": limit
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1/get-multi-paginated"
            end
            CandidApiClient::PreEncounter::Coverages::V1::Types::CoveragesPage.from_json(json_object: response.body)
          end

          # gets a specific Coverage
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.get(id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
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
                                                 request_options: request_options)}/coverages/v1/#{id}"
            end
            CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
          end

          # Gets a coverage along with it's full history.  The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.get_history(id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
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
                                                 request_options: request_options)}/coverages/v1/#{id}/history"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
            end
          end

          # Returns a list of Coverages based on the search criteria.
          #
          # @param patient_id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.get_multi
          def get_multi(patient_id: nil, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = { **(request_options&.additional_query_parameters || {}), "patient_id": patient_id }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
            end
          end

          # Scans up to 100 coverage updates.  The since query parameter is inclusive, and
          #  the result list is ordered by updatedAt ascending.
          #
          # @param since [DateTime]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.scan(since: DateTime.parse(2024-01-15T09:30:00.000Z))
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
                                                 request_options: request_options)}/coverages/v1/updates/scan"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
            end
          end

          # Finds all coverages associated with the given ppg_id and updates the ppg_fields
          #  for each coverage.
          #
          # @param ppg_id [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Coverages::V1::Types::PayerPlanGroupFields, as a Hash
          #   * :payer_plan_group_id (String)
          #   * :payer_id (String)
          #   * :payer_name (String)
          #   * :plan_type (CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.batch_update_ppg(ppg_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { payer_plan_group_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", payer_id: "payer_id", payer_name: "payer_name", plan_type: SELF_PAY })
          def batch_update_ppg(ppg_id:, request:, request_options: nil)
            @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1/batch-update-ppg/#{ppg_id}"
            end
          end

          # Initiates an eligibility check. Returns the metadata of the check if
          #  successfully initiated.
          #
          # @param id [String]
          # @param service_code [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceTypeCode]
          # @param date_of_service [Date]
          # @param npi [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.check_eligibility(
          #    id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
          #    service_code: MEDICAL_CARE,
          #    date_of_service: DateTime.parse(2023-01-15),
          #    npi: "npi"
          #  )
          def check_eligibility(id:, service_code:, date_of_service:, npi:, request_options: nil)
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                service_code: service_code,
                date_of_service: date_of_service,
                npi: npi
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1/#{id}/eligibility"
            end
            CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata.from_json(json_object: response.body)
          end

          # Gets the eligibility of a patient for a specific coverage if successful.
          #
          # @param id [String]
          # @param check_id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.get_eligibility(id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", check_id: "check_id")
          def get_eligibility(id:, check_id:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1/#{id}/eligibility/#{check_id}"
            end
            CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse.from_json(json_object: response.body)
          end
        end

        class AsyncV1Client
          # @return [CandidApiClient::AsyncRequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::AsyncV1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Creates a new Coverage. A Coverage provides the high-level identifiers and
          #  descriptors of a specific insurance plan for a specific individual - typically
          #  the information you can find on an insurance card. Additionally a coverage will
          #  include detailed benefits information covered by the specific plan for the
          #  individual.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage, as a Hash
          #   * :status (CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus)
          #   * :subscriber (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :suffix (String)
          #     * :date_of_birth (Date)
          #     * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
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
          #   * :relationship (CandidApiClient::PreEncounter::Common::Types::Relationship)
          #   * :patient (String)
          #   * :insurance_plan (Hash)
          #     * :member_id (String)
          #     * :payer_id (String)
          #     * :payer_name (String)
          #     * :additional_payer_information (Hash)
          #       * :availity_eligibility_id (String)
          #       * :availity_payer_id (String)
          #       * :availity_payer_name (String)
          #       * :availity_remittance_payer_id (String)
          #     * :group_number (String)
          #     * :name (String)
          #     * :plan_type (CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType)
          #     * :type (CandidApiClient::PreEncounter::Coverages::V1::Types::InsuranceTypeCode)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :insurance_card_image_locator (String)
          #     * :payer_plan_group_id (String)
          #   * :verified (Boolean)
          #   * :eligibility_checks (Array<CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata>)
          #   * :latest_eligibility_check (Hash)
          #     * :check_id (String)
          #     * :status (CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus)
          #     * :initiated_at (DateTime)
          #   * :benefits (Hash)
          #     * :plan_coverage (Hash)
          #       * :in_network (Hash)
          #         * :deductible (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :additional_notes (String)
          #       * :in_network_flat (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>)
          #       * :out_of_network (Hash)
          #         * :deductible (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :additional_notes (String)
          #       * :out_of_network_flat (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>)
          #     * :service_specific_coverage (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverage>)
          #     * :benefits_related_entities (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::BenefitsRelatedEntity>)
          #     * :notes (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.create(request: { status: ACTIVE, subscriber: { name: { family: "family", given: ["given", "given"], use: USUAL }, biological_sex: FEMALE }, relationship: SELF, patient: "patient", insurance_plan: { member_id: "member_id", payer_id: "payer_id", payer_name: "payer_name" }, verified: true })
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
                                                   request_options: request_options)}/coverages/v1"
              end
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
            end
          end

          # Updates a Coverage. The path must contain the next version number to prevent
          #  race conditions. For example, if the current version of the coverage is n, you
          #  will need to send a request to this endpoint with `/{id}/n+1` to update the
          #  coverage. Updating historic versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage, as a Hash
          #   * :status (CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus)
          #   * :subscriber (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :suffix (String)
          #     * :date_of_birth (Date)
          #     * :biological_sex (CandidApiClient::PreEncounter::Common::Types::Sex)
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
          #   * :relationship (CandidApiClient::PreEncounter::Common::Types::Relationship)
          #   * :patient (String)
          #   * :insurance_plan (Hash)
          #     * :member_id (String)
          #     * :payer_id (String)
          #     * :payer_name (String)
          #     * :additional_payer_information (Hash)
          #       * :availity_eligibility_id (String)
          #       * :availity_payer_id (String)
          #       * :availity_payer_name (String)
          #       * :availity_remittance_payer_id (String)
          #     * :group_number (String)
          #     * :name (String)
          #     * :plan_type (CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType)
          #     * :type (CandidApiClient::PreEncounter::Coverages::V1::Types::InsuranceTypeCode)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :insurance_card_image_locator (String)
          #     * :payer_plan_group_id (String)
          #   * :verified (Boolean)
          #   * :eligibility_checks (Array<CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata>)
          #   * :latest_eligibility_check (Hash)
          #     * :check_id (String)
          #     * :status (CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus)
          #     * :initiated_at (DateTime)
          #   * :benefits (Hash)
          #     * :plan_coverage (Hash)
          #       * :in_network (Hash)
          #         * :deductible (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :additional_notes (String)
          #       * :in_network_flat (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>)
          #       * :out_of_network (Hash)
          #         * :deductible (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :deductible_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_contract (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_remaining (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :oop_max_year_to_date (Hash)
          #           * :family (Float)
          #           * :individual (Float)
          #           * :employee_and_spouse (Float)
          #           * :employee_and_children (Float)
          #         * :additional_notes (String)
          #       * :out_of_network_flat (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>)
          #     * :service_specific_coverage (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverage>)
          #     * :benefits_related_entities (Array<CandidApiClient::PreEncounter::Coverages::V1::Types::BenefitsRelatedEntity>)
          #     * :notes (String)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.update(
          #    id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
          #    version: "version",
          #    request: { status: ACTIVE, subscriber: { name: { family: "family", given: ["given", "given"], use: USUAL }, biological_sex: FEMALE }, relationship: SELF, patient: "patient", insurance_plan: { member_id: "member_id", payer_id: "payer_id", payer_name: "payer_name" }, verified: true }
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
                                                   request_options: request_options)}/coverages/v1/#{id}/#{version}"
              end
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
            end
          end

          # Returns a page of Coverages based on the search criteria.
          #
          # @param patient_id [String]
          # @param payer_plan_group_id [String]
          # @param page_token [String]
          # @param limit [Integer] Must be between 0 and 1000. Defaults to 100
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoveragesPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.get_multi_paginated
          def get_multi_paginated(patient_id: nil, payer_plan_group_id: nil, page_token: nil, limit: nil,
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
                  "patient_id": patient_id,
                  "payer_plan_group_id": payer_plan_group_id,
                  "page_token": page_token,
                  "limit": limit
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/coverages/v1/get-multi-paginated"
              end
              CandidApiClient::PreEncounter::Coverages::V1::Types::CoveragesPage.from_json(json_object: response.body)
            end
          end

          # gets a specific Coverage
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.get(id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
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
                                                   request_options: request_options)}/coverages/v1/#{id}"
              end
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
            end
          end

          # Gets a coverage along with it's full history.  The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.get_history(id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
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
                                                   request_options: request_options)}/coverages/v1/#{id}/history"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
              end
            end
          end

          # Returns a list of Coverages based on the search criteria.
          #
          # @param patient_id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.get_multi
          def get_multi(patient_id: nil, request_options: nil)
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
                  "patient_id": patient_id
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/coverages/v1"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
              end
            end
          end

          # Scans up to 100 coverage updates.  The since query parameter is inclusive, and
          #  the result list is ordered by updatedAt ascending.
          #
          # @param since [DateTime]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.scan(since: DateTime.parse(2024-01-15T09:30:00.000Z))
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
                                                   request_options: request_options)}/coverages/v1/updates/scan"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
              end
            end
          end

          # Finds all coverages associated with the given ppg_id and updates the ppg_fields
          #  for each coverage.
          #
          # @param ppg_id [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Coverages::V1::Types::PayerPlanGroupFields, as a Hash
          #   * :payer_plan_group_id (String)
          #   * :payer_id (String)
          #   * :payer_name (String)
          #   * :plan_type (CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.batch_update_ppg(ppg_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { payer_plan_group_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", payer_id: "payer_id", payer_name: "payer_name", plan_type: SELF_PAY })
          def batch_update_ppg(ppg_id:, request:, request_options: nil)
            Async do
              @request_client.conn.post do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/coverages/v1/batch-update-ppg/#{ppg_id}"
              end
            end
          end

          # Initiates an eligibility check. Returns the metadata of the check if
          #  successfully initiated.
          #
          # @param id [String]
          # @param service_code [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceTypeCode]
          # @param date_of_service [Date]
          # @param npi [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.check_eligibility(
          #    id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
          #    service_code: MEDICAL_CARE,
          #    date_of_service: DateTime.parse(2023-01-15),
          #    npi: "npi"
          #  )
          def check_eligibility(id:, service_code:, date_of_service:, npi:, request_options: nil)
            Async do
              response = @request_client.conn.post do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.body = {
                  **(request_options&.additional_body_parameters || {}),
                  service_code: service_code,
                  date_of_service: date_of_service,
                  npi: npi
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/coverages/v1/#{id}/eligibility"
              end
              CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata.from_json(json_object: response.body)
            end
          end

          # Gets the eligibility of a patient for a specific coverage if successful.
          #
          # @param id [String]
          # @param check_id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.coverages.v_1.get_eligibility(id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", check_id: "check_id")
          def get_eligibility(id:, check_id:, request_options: nil)
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
                                                   request_options: request_options)}/coverages/v1/#{id}/eligibility/#{check_id}"
              end
              CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse.from_json(json_object: response.body)
            end
          end
        end
      end
    end
  end
end
