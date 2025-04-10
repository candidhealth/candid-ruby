# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/match_result"
require_relative "types/match_test_result"
require "date"
require_relative "../../commons/types/state"
require_relative "../../organization_providers/v_2/types/license_type"
require_relative "../../commons/types/facility_type_code"
require_relative "../../commons/types/network_type"
require_relative "../../commons/types/procedure_modifier"
require_relative "types/rates_page"
require_relative "types/dimension_name"
require_relative "types/dimensions_page"
require_relative "types/rate"
require "json"
require_relative "types/rate_upload"
require_relative "types/payer_threshold"
require_relative "types/payer_thresholds_page"
require "async"

module CandidApiClient
  module FeeSchedules
    module V3
      class V3Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::FeeSchedules::V3::V3Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Gets the rate that matches a service line. No result means no rate exists
        #  matching the service line's dimensions.
        #
        # @param service_line_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::MatchResult]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_match(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get_match(service_line_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/fee-schedules/v3/service-line/#{service_line_id}/match"
          end
          CandidApiClient::FeeSchedules::V3::Types::MatchResult.from_json(json_object: response.body)
        end

        # Tests a service line against a rate to see if it matches.
        #
        # @param service_line_id [String]
        # @param rate_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::MatchTestResult]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.test_match(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", rate_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def test_match(service_line_id:, rate_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/fee-schedules/v3/service-line/#{service_line_id}/match/#{rate_id}"
          end
          CandidApiClient::FeeSchedules::V3::Types::MatchTestResult.from_json(json_object: response.body)
        end

        # Gets a list of dimensions with their rates. The rates returned will always be
        #  the most recent versions of those rates.
        #
        # @param page_token [String]
        # @param limit [Integer] Max number of dimensions returned. Defaults to 100. Max is 100.
        # @param active_date [Date]
        # @param payer_uuid [String]
        # @param organization_billing_provider_id [String]
        # @param states [CandidApiClient::Commons::Types::State]
        # @param zip_codes [String]
        # @param license_types [CandidApiClient::OrganizationProviders::V2::Types::LicenseType]
        # @param facility_type_codes [CandidApiClient::Commons::Types::FacilityTypeCode]
        # @param network_types [CandidApiClient::Commons::Types::NetworkType]
        # @param payer_plan_group_ids [String]
        # @param cpt_code [String]
        # @param modifiers [CandidApiClient::Commons::Types::ProcedureModifier]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::RatesPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_multi(
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    limit: 1,
        #    active_date: DateTime.parse(2023-01-15),
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    organization_billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    states: AA,
        #    zip_codes: "string",
        #    license_types: MD,
        #    facility_type_codes: PHARMACY,
        #    network_types: PPO,
        #    payer_plan_group_ids: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    cpt_code: "string",
        #    modifiers: AV
        #  )
        def get_multi(page_token: nil, limit: nil, active_date: nil, payer_uuid: nil,
                      organization_billing_provider_id: nil, states: nil, zip_codes: nil, license_types: nil, facility_type_codes: nil, network_types: nil, payer_plan_group_ids: nil, cpt_code: nil, modifiers: nil, request_options: nil)
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
              "page_token": page_token,
              "limit": limit,
              "active_date": active_date,
              "payer_uuid": payer_uuid,
              "organization_billing_provider_id": organization_billing_provider_id,
              "states": states,
              "zip_codes": zip_codes,
              "license_types": license_types,
              "facility_type_codes": facility_type_codes,
              "network_types": network_types,
              "payer_plan_group_ids": payer_plan_group_ids,
              "cpt_code": cpt_code,
              "modifiers": modifiers
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/fee-schedules/v3"
          end
          CandidApiClient::FeeSchedules::V3::Types::RatesPage.from_json(json_object: response.body)
        end

        # Gets unique values for a dimension based on other selection criteria. The
        #  response is a list of dimensions with your criteria and the unique values
        #  populated. This API is useful for driving pivots on dimension values.
        #
        # @param page_token [String]
        # @param limit [Integer] Max number of values returned. Defaults to 1000. Max is 1000.
        # @param pivot_dimension [CandidApiClient::FeeSchedules::V3::Types::DimensionName] The name of the dimension to fetch unique values for.
        # @param payer_uuid [String]
        # @param organization_billing_provider_id [String]
        # @param states [CandidApiClient::Commons::Types::State]
        # @param zip_codes [String]
        # @param license_types [CandidApiClient::OrganizationProviders::V2::Types::LicenseType]
        # @param facility_type_codes [CandidApiClient::Commons::Types::FacilityTypeCode]
        # @param network_types [CandidApiClient::Commons::Types::NetworkType]
        # @param payer_plan_group_ids [String]
        # @param cpt_code [String]
        # @param modifiers [CandidApiClient::Commons::Types::ProcedureModifier]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::DimensionsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_unique_values_for_dimension(
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    limit: 1,
        #    pivot_dimension: PAYER_UUID,
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    organization_billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    states: AA,
        #    zip_codes: "string",
        #    license_types: MD,
        #    facility_type_codes: PHARMACY,
        #    network_types: PPO,
        #    payer_plan_group_ids: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    cpt_code: "string",
        #    modifiers: AV
        #  )
        def get_unique_values_for_dimension(pivot_dimension:, page_token: nil, limit: nil, payer_uuid: nil,
                                            organization_billing_provider_id: nil, states: nil, zip_codes: nil, license_types: nil, facility_type_codes: nil, network_types: nil, payer_plan_group_ids: nil, cpt_code: nil, modifiers: nil, request_options: nil)
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
              "page_token": page_token,
              "limit": limit,
              "pivot_dimension": pivot_dimension,
              "payer_uuid": payer_uuid,
              "organization_billing_provider_id": organization_billing_provider_id,
              "states": states,
              "zip_codes": zip_codes,
              "license_types": license_types,
              "facility_type_codes": facility_type_codes,
              "network_types": network_types,
              "payer_plan_group_ids": payer_plan_group_ids,
              "cpt_code": cpt_code,
              "modifiers": modifiers
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/fee-schedules/v3/unique-dimension-values"
          end
          CandidApiClient::FeeSchedules::V3::Types::DimensionsPage.from_json(json_object: response.body)
        end

        # Gets every version of a rate.
        #
        # @param rate_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Array<CandidApiClient::FeeSchedules::V3::Types::Rate>]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_rate_history(rate_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get_rate_history(rate_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/fee-schedules/v3/#{rate_id}/history"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            CandidApiClient::FeeSchedules::V3::Types::Rate.from_json(json_object: item)
          end
        end

        # Uploads a new fee schedule.\n Each rate may either be totally new as qualified
        #  by it's dimensions or a new version for an existing rate.\n If adding a new
        #  version to an existing rate, the rate must be posted with the next version
        #  number (previous version + 1) or a EntityConflictError will be returned.\n Use
        #  the dry run flag to discover already existing rates and to run validations. If
        #  validations for any rate fail, no rates will be saved to the system.
        #
        # @param dry_run [Boolean]
        # @param rates [Array<Hash>] Request of type Array<CandidApiClient::FeeSchedules::V3::Types::RateUpload>, as a Hash
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Array<CandidApiClient::FeeSchedules::V3::Types::Rate>]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.upload_fee_schedule(dry_run: true, rates: )
        def upload_fee_schedule(dry_run:, rates:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), dry_run: dry_run, rates: rates }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/fee-schedules/v3"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            CandidApiClient::FeeSchedules::V3::Types::Rate.from_json(json_object: item)
          end
        end

        # Soft deletes a rate from the system. Only the most recent version of a rate can
        #  be deleted.
        #
        # @param rate_id [String]
        # @param version [Integer]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.delete_rate(rate_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", version: 1)
        def delete_rate(rate_id:, version:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/fee-schedules/v3/#{rate_id}/#{version}"
          end
        end

        # Gets the default payer threshold
        #
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::PayerThreshold]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_payer_thresholds_default
        def get_payer_thresholds_default(request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/fee-schedules/v3/payer-threshold/default"
          end
          CandidApiClient::FeeSchedules::V3::Types::PayerThreshold.from_json(json_object: response.body)
        end

        # Gets a list of payers and thresholds by their uuids
        #
        # @param payer_uuids [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::PayerThresholdsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_payer_thresholds(payer_uuids: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get_payer_thresholds(payer_uuids:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = { **(request_options&.additional_query_parameters || {}), "payer_uuids": payer_uuids }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/fee-schedules/v3/payer-threshold"
          end
          CandidApiClient::FeeSchedules::V3::Types::PayerThresholdsPage.from_json(json_object: response.body)
        end

        # Sets the threshold information for a payer
        #
        # @param payer_uuid [String]
        # @param request [Hash] Request of type CandidApiClient::FeeSchedules::V3::Types::PayerThreshold, as a Hash
        #   * :upper_threshold_cents (Integer)
        #   * :lower_threshold_cents (Integer)
        #   * :disable_paid_incorrectly (Boolean)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::PayerThreshold]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.set_payer_threshold(payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { upper_threshold_cents: 1, lower_threshold_cents: 1, disable_paid_incorrectly: true })
        def set_payer_threshold(payer_uuid:, request:, request_options: nil)
          response = @request_client.conn.put do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/fee-schedules/v3/payer-threshold/#{payer_uuid}"
          end
          CandidApiClient::FeeSchedules::V3::Types::PayerThreshold.from_json(json_object: response.body)
        end
      end

      class AsyncV3Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::FeeSchedules::V3::AsyncV3Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Gets the rate that matches a service line. No result means no rate exists
        #  matching the service line's dimensions.
        #
        # @param service_line_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::MatchResult]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_match(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get_match(service_line_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/fee-schedules/v3/service-line/#{service_line_id}/match"
            end
            CandidApiClient::FeeSchedules::V3::Types::MatchResult.from_json(json_object: response.body)
          end
        end

        # Tests a service line against a rate to see if it matches.
        #
        # @param service_line_id [String]
        # @param rate_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::MatchTestResult]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.test_match(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", rate_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def test_match(service_line_id:, rate_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/fee-schedules/v3/service-line/#{service_line_id}/match/#{rate_id}"
            end
            CandidApiClient::FeeSchedules::V3::Types::MatchTestResult.from_json(json_object: response.body)
          end
        end

        # Gets a list of dimensions with their rates. The rates returned will always be
        #  the most recent versions of those rates.
        #
        # @param page_token [String]
        # @param limit [Integer] Max number of dimensions returned. Defaults to 100. Max is 100.
        # @param active_date [Date]
        # @param payer_uuid [String]
        # @param organization_billing_provider_id [String]
        # @param states [CandidApiClient::Commons::Types::State]
        # @param zip_codes [String]
        # @param license_types [CandidApiClient::OrganizationProviders::V2::Types::LicenseType]
        # @param facility_type_codes [CandidApiClient::Commons::Types::FacilityTypeCode]
        # @param network_types [CandidApiClient::Commons::Types::NetworkType]
        # @param payer_plan_group_ids [String]
        # @param cpt_code [String]
        # @param modifiers [CandidApiClient::Commons::Types::ProcedureModifier]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::RatesPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_multi(
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    limit: 1,
        #    active_date: DateTime.parse(2023-01-15),
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    organization_billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    states: AA,
        #    zip_codes: "string",
        #    license_types: MD,
        #    facility_type_codes: PHARMACY,
        #    network_types: PPO,
        #    payer_plan_group_ids: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    cpt_code: "string",
        #    modifiers: AV
        #  )
        def get_multi(page_token: nil, limit: nil, active_date: nil, payer_uuid: nil,
                      organization_billing_provider_id: nil, states: nil, zip_codes: nil, license_types: nil, facility_type_codes: nil, network_types: nil, payer_plan_group_ids: nil, cpt_code: nil, modifiers: nil, request_options: nil)
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
                "page_token": page_token,
                "limit": limit,
                "active_date": active_date,
                "payer_uuid": payer_uuid,
                "organization_billing_provider_id": organization_billing_provider_id,
                "states": states,
                "zip_codes": zip_codes,
                "license_types": license_types,
                "facility_type_codes": facility_type_codes,
                "network_types": network_types,
                "payer_plan_group_ids": payer_plan_group_ids,
                "cpt_code": cpt_code,
                "modifiers": modifiers
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/fee-schedules/v3"
            end
            CandidApiClient::FeeSchedules::V3::Types::RatesPage.from_json(json_object: response.body)
          end
        end

        # Gets unique values for a dimension based on other selection criteria. The
        #  response is a list of dimensions with your criteria and the unique values
        #  populated. This API is useful for driving pivots on dimension values.
        #
        # @param page_token [String]
        # @param limit [Integer] Max number of values returned. Defaults to 1000. Max is 1000.
        # @param pivot_dimension [CandidApiClient::FeeSchedules::V3::Types::DimensionName] The name of the dimension to fetch unique values for.
        # @param payer_uuid [String]
        # @param organization_billing_provider_id [String]
        # @param states [CandidApiClient::Commons::Types::State]
        # @param zip_codes [String]
        # @param license_types [CandidApiClient::OrganizationProviders::V2::Types::LicenseType]
        # @param facility_type_codes [CandidApiClient::Commons::Types::FacilityTypeCode]
        # @param network_types [CandidApiClient::Commons::Types::NetworkType]
        # @param payer_plan_group_ids [String]
        # @param cpt_code [String]
        # @param modifiers [CandidApiClient::Commons::Types::ProcedureModifier]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::DimensionsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_unique_values_for_dimension(
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    limit: 1,
        #    pivot_dimension: PAYER_UUID,
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    organization_billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    states: AA,
        #    zip_codes: "string",
        #    license_types: MD,
        #    facility_type_codes: PHARMACY,
        #    network_types: PPO,
        #    payer_plan_group_ids: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    cpt_code: "string",
        #    modifiers: AV
        #  )
        def get_unique_values_for_dimension(pivot_dimension:, page_token: nil, limit: nil, payer_uuid: nil,
                                            organization_billing_provider_id: nil, states: nil, zip_codes: nil, license_types: nil, facility_type_codes: nil, network_types: nil, payer_plan_group_ids: nil, cpt_code: nil, modifiers: nil, request_options: nil)
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
                "page_token": page_token,
                "limit": limit,
                "pivot_dimension": pivot_dimension,
                "payer_uuid": payer_uuid,
                "organization_billing_provider_id": organization_billing_provider_id,
                "states": states,
                "zip_codes": zip_codes,
                "license_types": license_types,
                "facility_type_codes": facility_type_codes,
                "network_types": network_types,
                "payer_plan_group_ids": payer_plan_group_ids,
                "cpt_code": cpt_code,
                "modifiers": modifiers
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/fee-schedules/v3/unique-dimension-values"
            end
            CandidApiClient::FeeSchedules::V3::Types::DimensionsPage.from_json(json_object: response.body)
          end
        end

        # Gets every version of a rate.
        #
        # @param rate_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Array<CandidApiClient::FeeSchedules::V3::Types::Rate>]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_rate_history(rate_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get_rate_history(rate_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/fee-schedules/v3/#{rate_id}/history"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::FeeSchedules::V3::Types::Rate.from_json(json_object: item)
            end
          end
        end

        # Uploads a new fee schedule.\n Each rate may either be totally new as qualified
        #  by it's dimensions or a new version for an existing rate.\n If adding a new
        #  version to an existing rate, the rate must be posted with the next version
        #  number (previous version + 1) or a EntityConflictError will be returned.\n Use
        #  the dry run flag to discover already existing rates and to run validations. If
        #  validations for any rate fail, no rates will be saved to the system.
        #
        # @param dry_run [Boolean]
        # @param rates [Array<Hash>] Request of type Array<CandidApiClient::FeeSchedules::V3::Types::RateUpload>, as a Hash
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Array<CandidApiClient::FeeSchedules::V3::Types::Rate>]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.upload_fee_schedule(dry_run: true, rates: )
        def upload_fee_schedule(dry_run:, rates:, request_options: nil)
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
                dry_run: dry_run,
                rates: rates
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/fee-schedules/v3"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::FeeSchedules::V3::Types::Rate.from_json(json_object: item)
            end
          end
        end

        # Soft deletes a rate from the system. Only the most recent version of a rate can
        #  be deleted.
        #
        # @param rate_id [String]
        # @param version [Integer]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.delete_rate(rate_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", version: 1)
        def delete_rate(rate_id:, version:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/fee-schedules/v3/#{rate_id}/#{version}"
            end
          end
        end

        # Gets the default payer threshold
        #
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::PayerThreshold]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_payer_thresholds_default
        def get_payer_thresholds_default(request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/fee-schedules/v3/payer-threshold/default"
            end
            CandidApiClient::FeeSchedules::V3::Types::PayerThreshold.from_json(json_object: response.body)
          end
        end

        # Gets a list of payers and thresholds by their uuids
        #
        # @param payer_uuids [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::PayerThresholdsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.get_payer_thresholds(payer_uuids: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get_payer_thresholds(payer_uuids:, request_options: nil)
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
                "payer_uuids": payer_uuids
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/fee-schedules/v3/payer-threshold"
            end
            CandidApiClient::FeeSchedules::V3::Types::PayerThresholdsPage.from_json(json_object: response.body)
          end
        end

        # Sets the threshold information for a payer
        #
        # @param payer_uuid [String]
        # @param request [Hash] Request of type CandidApiClient::FeeSchedules::V3::Types::PayerThreshold, as a Hash
        #   * :upper_threshold_cents (Integer)
        #   * :lower_threshold_cents (Integer)
        #   * :disable_paid_incorrectly (Boolean)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::FeeSchedules::V3::Types::PayerThreshold]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.fee_schedules.v_3.set_payer_threshold(payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { upper_threshold_cents: 1, lower_threshold_cents: 1, disable_paid_incorrectly: true })
        def set_payer_threshold(payer_uuid:, request:, request_options: nil)
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
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/fee-schedules/v3/payer-threshold/#{payer_uuid}"
            end
            CandidApiClient::FeeSchedules::V3::Types::PayerThreshold.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
