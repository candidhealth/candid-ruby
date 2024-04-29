# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../commons/types/service_line_id"
require_relative "types/match_result"
require_relative "../../commons/types/rate_id"
require_relative "types/match_test_result"
require_relative "../../commons/types/page_token"
require "date"
require_relative "../../payers/v_3/types/payer_uuid"
require_relative "../../organization_providers/v_2/types/organization_provider_id"
require_relative "../../commons/types/state"
require_relative "../../organization_providers/v_2/types/license_type"
require_relative "../../commons/types/facility_type_code"
require_relative "../../commons/types/network_type"
require_relative "../../commons/types/procedure_modifier"
require_relative "types/rates_page"
require_relative "types/dimension_name"
require_relative "types/dimensions_page"
require_relative "types/rate"
require_relative "types/rate_upload"
require_relative "types/payer_threshold"
require_relative "types/payer_thresholds_page"
require "async"

module CandidApiClient
  module FeeSchedules
    module V3
      class V3Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [FeeSchedules::V3::V3Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Gets the rate that matches a service line. No result means no rate exists matching the service line's dimensions.
        #
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::MatchResult]
        def get_match(service_line_id:, request_options: nil)
          response = @request_client.conn.get("/api/fee-schedules/v3/service-line/#{service_line_id}/match") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          FeeSchedules::V3::MatchResult.from_json(json_object: response.body)
        end

        # Tests a service line against a rate to see if it matches.
        #
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param rate_id [Commons::RATE_ID]
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::MatchTestResult]
        def test_match(service_line_id:, rate_id:, request_options: nil)
          response = @request_client.conn.get("/api/fee-schedules/v3/service-line/#{service_line_id}/match/#{rate_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          FeeSchedules::V3::MatchTestResult.from_json(json_object: response.body)
        end

        # Gets a list of dimensions with their rates. The rates returned will always be the most recent versions of those rates.
        #
        # @param page_token [Commons::PAGE_TOKEN]
        # @param limit [Integer] Max number of dimensions returned. Defaults to 100. Max is 100.
        # @param active_date [Date]
        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param organization_billing_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param states [Commons::State]
        # @param zip_codes [String]
        # @param license_types [OrganizationProviders::V2::LicenseType]
        # @param facility_type_codes [Commons::FacilityTypeCode]
        # @param network_types [Commons::NetworkType]
        # @param cpt_code [String]
        # @param modifiers [Commons::ProcedureModifier]
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::RatesPage]
        def get_multi(page_token: nil, limit: nil, active_date: nil, payer_uuid: nil,
                      organization_billing_provider_id: nil, states: nil, zip_codes: nil, license_types: nil, facility_type_codes: nil, network_types: nil, cpt_code: nil, modifiers: nil, request_options: nil)
          response = @request_client.conn.get("/api/fee-schedules/v3") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
              "cpt_code": cpt_code,
              "modifiers": modifiers
            }.compact
          end
          FeeSchedules::V3::RatesPage.from_json(json_object: response.body)
        end

        # Gets unique values for a dimension based on other selection criteria. The response is a list of dimensions with your criteria and the unique values populated. This API is useful for driving pivots on dimension values.
        #
        # @param page_token [Commons::PAGE_TOKEN]
        # @param limit [Integer] Max number of values returned. Defaults to 1000. Max is 1000.
        # @param pivot_dimension [FeeSchedules::V3::DimensionName] The name of the dimension to fetch unique values for.
        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param organization_billing_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param states [Commons::State]
        # @param zip_codes [String]
        # @param license_types [OrganizationProviders::V2::LicenseType]
        # @param facility_type_codes [Commons::FacilityTypeCode]
        # @param network_types [Commons::NetworkType]
        # @param cpt_code [String]
        # @param modifiers [Commons::ProcedureModifier]
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::DimensionsPage]
        def get_unique_values_for_dimension(pivot_dimension:, page_token: nil, limit: nil, payer_uuid: nil,
                                            organization_billing_provider_id: nil, states: nil, zip_codes: nil, license_types: nil, facility_type_codes: nil, network_types: nil, cpt_code: nil, modifiers: nil, request_options: nil)
          response = @request_client.conn.get("/api/fee-schedules/v3/unique-dimension-values") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
              "cpt_code": cpt_code,
              "modifiers": modifiers
            }.compact
          end
          FeeSchedules::V3::DimensionsPage.from_json(json_object: response.body)
        end

        # Gets every version of a rate.
        #
        # @param rate_id [Commons::RATE_ID]
        # @param request_options [RequestOptions]
        # @return [Array<FeeSchedules::V3::Rate>]
        def get_rate_history(rate_id:, request_options: nil)
          response = @request_client.conn.get("/api/fee-schedules/v3/#{rate_id}/history") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          return if response.body.nil?

          response.body.map do |v|
            v = v.to_json
            FeeSchedules::V3::Rate.from_json(json_object: v)
          end
        end

        # Uploads a new fee schedule.\n Each rate may either be totally new as qualified by it's dimensions or a new version for an existing rate.\n If adding a new version to an existing rate, the rate must be posted with the next version number (previous version + 1) or a EntityConflictError will be returned.\n Use the dry run flag to discover already existing rates and to run validations. If validations for any rate fail, no rates will be saved to the system.
        #
        # @param dry_run [Boolean]
        # @param rates [Array<Hash>] Request of type Array<FeeSchedules::V3::RateUpload>, as a Hash
        # @param request_options [RequestOptions]
        # @return [Array<FeeSchedules::V3::Rate>]
        def upload_fee_schedule(dry_run:, rates:, request_options: nil)
          response = @request_client.conn.post("/api/fee-schedules/v3") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), dry_run: dry_run, rates: rates }.compact
          end
          return if response.body.nil?

          response.body.map do |v|
            v = v.to_json
            FeeSchedules::V3::Rate.from_json(json_object: v)
          end
        end

        # Soft deletes a rate from the system. Only the most recent version of a rate can be deleted.
        #
        # @param rate_id [Commons::RATE_ID]
        # @param version [Integer]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete_rate(rate_id:, version:, request_options: nil)
          @request_client.conn.delete("/api/fee-schedules/v3/#{rate_id}/#{version}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end

        # Gets the default payer threshold
        #
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::PayerThreshold]
        def get_payer_thresholds_default(request_options: nil)
          response = @request_client.conn.get("/api/fee-schedules/v3/payer-threshold/default") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          FeeSchedules::V3::PayerThreshold.from_json(json_object: response.body)
        end

        # Gets a list of payers and thresholds by their uuids
        #
        # @param payer_uuids [Payers::V3::PAYER_UUID]
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::PayerThresholdsPage]
        def get_payer_thresholds(payer_uuids:, request_options: nil)
          response = @request_client.conn.get("/api/fee-schedules/v3/payer-threshold") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = { **(request_options&.additional_query_parameters || {}), "payer_uuids": payer_uuids }.compact
          end
          FeeSchedules::V3::PayerThresholdsPage.from_json(json_object: response.body)
        end

        # Sets the threshold information for a payer
        #
        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param request [Hash] Request of type FeeSchedules::V3::PayerThreshold, as a Hash
        #   * :upper_threshold_cents (Integer)
        #   * :lower_threshold_cents (Integer)
        #   * :disable_paid_incorrectly (Boolean)
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::PayerThreshold]
        def set_payer_threshold(payer_uuid:, request:, request_options: nil)
          response = @request_client.conn.put("/api/fee-schedules/v3/payer-threshold/#{payer_uuid}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          FeeSchedules::V3::PayerThreshold.from_json(json_object: response.body)
        end
      end

      class AsyncV3Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [FeeSchedules::V3::AsyncV3Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Gets the rate that matches a service line. No result means no rate exists matching the service line's dimensions.
        #
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::MatchResult]
        def get_match(service_line_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/fee-schedules/v3/service-line/#{service_line_id}/match") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            FeeSchedules::V3::MatchResult.from_json(json_object: response.body)
          end
        end

        # Tests a service line against a rate to see if it matches.
        #
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param rate_id [Commons::RATE_ID]
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::MatchTestResult]
        def test_match(service_line_id:, rate_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/fee-schedules/v3/service-line/#{service_line_id}/match/#{rate_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            FeeSchedules::V3::MatchTestResult.from_json(json_object: response.body)
          end
        end

        # Gets a list of dimensions with their rates. The rates returned will always be the most recent versions of those rates.
        #
        # @param page_token [Commons::PAGE_TOKEN]
        # @param limit [Integer] Max number of dimensions returned. Defaults to 100. Max is 100.
        # @param active_date [Date]
        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param organization_billing_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param states [Commons::State]
        # @param zip_codes [String]
        # @param license_types [OrganizationProviders::V2::LicenseType]
        # @param facility_type_codes [Commons::FacilityTypeCode]
        # @param network_types [Commons::NetworkType]
        # @param cpt_code [String]
        # @param modifiers [Commons::ProcedureModifier]
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::RatesPage]
        def get_multi(page_token: nil, limit: nil, active_date: nil, payer_uuid: nil,
                      organization_billing_provider_id: nil, states: nil, zip_codes: nil, license_types: nil, facility_type_codes: nil, network_types: nil, cpt_code: nil, modifiers: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/fee-schedules/v3") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
                "cpt_code": cpt_code,
                "modifiers": modifiers
              }.compact
            end
            FeeSchedules::V3::RatesPage.from_json(json_object: response.body)
          end
        end

        # Gets unique values for a dimension based on other selection criteria. The response is a list of dimensions with your criteria and the unique values populated. This API is useful for driving pivots on dimension values.
        #
        # @param page_token [Commons::PAGE_TOKEN]
        # @param limit [Integer] Max number of values returned. Defaults to 1000. Max is 1000.
        # @param pivot_dimension [FeeSchedules::V3::DimensionName] The name of the dimension to fetch unique values for.
        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param organization_billing_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param states [Commons::State]
        # @param zip_codes [String]
        # @param license_types [OrganizationProviders::V2::LicenseType]
        # @param facility_type_codes [Commons::FacilityTypeCode]
        # @param network_types [Commons::NetworkType]
        # @param cpt_code [String]
        # @param modifiers [Commons::ProcedureModifier]
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::DimensionsPage]
        def get_unique_values_for_dimension(pivot_dimension:, page_token: nil, limit: nil, payer_uuid: nil,
                                            organization_billing_provider_id: nil, states: nil, zip_codes: nil, license_types: nil, facility_type_codes: nil, network_types: nil, cpt_code: nil, modifiers: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/fee-schedules/v3/unique-dimension-values") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
                "cpt_code": cpt_code,
                "modifiers": modifiers
              }.compact
            end
            FeeSchedules::V3::DimensionsPage.from_json(json_object: response.body)
          end
        end

        # Gets every version of a rate.
        #
        # @param rate_id [Commons::RATE_ID]
        # @param request_options [RequestOptions]
        # @return [Array<FeeSchedules::V3::Rate>]
        def get_rate_history(rate_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/fee-schedules/v3/#{rate_id}/history") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            response.body&.map do |v|
              v = v.to_json
              FeeSchedules::V3::Rate.from_json(json_object: v)
            end
          end
        end

        # Uploads a new fee schedule.\n Each rate may either be totally new as qualified by it's dimensions or a new version for an existing rate.\n If adding a new version to an existing rate, the rate must be posted with the next version number (previous version + 1) or a EntityConflictError will be returned.\n Use the dry run flag to discover already existing rates and to run validations. If validations for any rate fail, no rates will be saved to the system.
        #
        # @param dry_run [Boolean]
        # @param rates [Array<Hash>] Request of type Array<FeeSchedules::V3::RateUpload>, as a Hash
        # @param request_options [RequestOptions]
        # @return [Array<FeeSchedules::V3::Rate>]
        def upload_fee_schedule(dry_run:, rates:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/fee-schedules/v3") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                dry_run: dry_run,
                rates: rates
              }.compact
            end
            response.body&.map do |v|
              v = v.to_json
              FeeSchedules::V3::Rate.from_json(json_object: v)
            end
          end
        end

        # Soft deletes a rate from the system. Only the most recent version of a rate can be deleted.
        #
        # @param rate_id [Commons::RATE_ID]
        # @param version [Integer]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete_rate(rate_id:, version:, request_options: nil)
          Async do
            @request_client.conn.delete("/api/fee-schedules/v3/#{rate_id}/#{version}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
          end
        end

        # Gets the default payer threshold
        #
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::PayerThreshold]
        def get_payer_thresholds_default(request_options: nil)
          Async do
            response = @request_client.conn.get("/api/fee-schedules/v3/payer-threshold/default") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            FeeSchedules::V3::PayerThreshold.from_json(json_object: response.body)
          end
        end

        # Gets a list of payers and thresholds by their uuids
        #
        # @param payer_uuids [Payers::V3::PAYER_UUID]
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::PayerThresholdsPage]
        def get_payer_thresholds(payer_uuids:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/fee-schedules/v3/payer-threshold") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "payer_uuids": payer_uuids
              }.compact
            end
            FeeSchedules::V3::PayerThresholdsPage.from_json(json_object: response.body)
          end
        end

        # Sets the threshold information for a payer
        #
        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param request [Hash] Request of type FeeSchedules::V3::PayerThreshold, as a Hash
        #   * :upper_threshold_cents (Integer)
        #   * :lower_threshold_cents (Integer)
        #   * :disable_paid_incorrectly (Boolean)
        # @param request_options [RequestOptions]
        # @return [FeeSchedules::V3::PayerThreshold]
        def set_payer_threshold(payer_uuid:, request:, request_options: nil)
          Async do
            response = @request_client.conn.put("/api/fee-schedules/v3/payer-threshold/#{payer_uuid}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            FeeSchedules::V3::PayerThreshold.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
