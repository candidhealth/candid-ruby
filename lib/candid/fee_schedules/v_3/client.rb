# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
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

        # Gets the rate that matches a service line.  No result means no rate exists matching the service line's
        # dimensions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::ServiceLineId] :service_line_id
        #
        # @return [Candid::FeeSchedules::V3::Types::MatchResult, nil]
        def get_match(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/fee-schedules/v3/service-line/#{params[:service_line_id]}/match",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end

        # Tests a service line against a rate to see if it matches.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::ServiceLineId] :service_line_id
        # @option params [Candid::Commons::Types::RateId] :rate_id
        #
        # @return [Candid::FeeSchedules::V3::Types::MatchTestResult]
        def test_match(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/fee-schedules/v3/service-line/#{params[:service_line_id]}/match/#{params[:rate_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::FeeSchedules::V3::Types::MatchTestResult.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Gets a list of dimensions with their rates. The rates returned will always be the most recent versions of
        # those rates.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :page_token
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :active_date
        # @option params [String, nil] :payer_uuid
        # @option params [String, nil] :organization_billing_provider_id
        # @option params [Candid::Commons::Types::State, nil] :states
        # @option params [String, nil] :zip_codes
        # @option params [Candid::OrganizationProviders::V2::Types::LicenseType, nil] :license_types
        # @option params [Candid::Commons::Types::FacilityTypeCode, nil] :facility_type_codes
        # @option params [Candid::Commons::Types::NetworkType, nil] :network_types
        # @option params [String, nil] :payer_plan_group_ids
        # @option params [String, nil] :cpt_code
        # @option params [Candid::Commons::Types::ProcedureModifier, nil] :modifiers
        #
        # @return [Candid::FeeSchedules::V3::Types::RatesPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[page_token limit active_date payer_uuid organization_billing_provider_id states zip_codes license_types facility_type_codes network_types payer_plan_group_ids cpt_code modifiers]
          query_params = {}
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["active_date"] = params[:active_date] if params.key?(:active_date)
          query_params["payer_uuid"] = params[:payer_uuid] if params.key?(:payer_uuid)
          query_params["organization_billing_provider_id"] = params[:organization_billing_provider_id] if params.key?(:organization_billing_provider_id)
          query_params["states"] = params[:states] if params.key?(:states)
          query_params["zip_codes"] = params[:zip_codes] if params.key?(:zip_codes)
          query_params["license_types"] = params[:license_types] if params.key?(:license_types)
          query_params["facility_type_codes"] = params[:facility_type_codes] if params.key?(:facility_type_codes)
          query_params["network_types"] = params[:network_types] if params.key?(:network_types)
          query_params["payer_plan_group_ids"] = params[:payer_plan_group_ids] if params.key?(:payer_plan_group_ids)
          query_params["cpt_code"] = params[:cpt_code] if params.key?(:cpt_code)
          query_params["modifiers"] = params[:modifiers] if params.key?(:modifiers)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/fee-schedules/v3",
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
            Candid::FeeSchedules::V3::Types::RatesPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Gets unique values for a dimension based on other selection criteria. The response is a list of dimensions
        # with your criteria and the unique values populated. This API is useful for driving pivots on dimension values.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :page_token
        # @option params [Integer, nil] :limit
        # @option params [Candid::FeeSchedules::V3::Types::DimensionName] :pivot_dimension
        # @option params [String, nil] :payer_uuid
        # @option params [String, nil] :organization_billing_provider_id
        # @option params [Candid::Commons::Types::State, nil] :states
        # @option params [String, nil] :zip_codes
        # @option params [Candid::OrganizationProviders::V2::Types::LicenseType, nil] :license_types
        # @option params [Candid::Commons::Types::FacilityTypeCode, nil] :facility_type_codes
        # @option params [Candid::Commons::Types::NetworkType, nil] :network_types
        # @option params [String, nil] :payer_plan_group_ids
        # @option params [String, nil] :cpt_code
        # @option params [Candid::Commons::Types::ProcedureModifier, nil] :modifiers
        #
        # @return [Candid::FeeSchedules::V3::Types::DimensionsPage]
        def get_unique_values_for_dimension(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[page_token limit pivot_dimension payer_uuid organization_billing_provider_id states zip_codes license_types facility_type_codes network_types payer_plan_group_ids cpt_code modifiers]
          query_params = {}
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["pivot_dimension"] = params[:pivot_dimension] if params.key?(:pivot_dimension)
          query_params["payer_uuid"] = params[:payer_uuid] if params.key?(:payer_uuid)
          query_params["organization_billing_provider_id"] = params[:organization_billing_provider_id] if params.key?(:organization_billing_provider_id)
          query_params["states"] = params[:states] if params.key?(:states)
          query_params["zip_codes"] = params[:zip_codes] if params.key?(:zip_codes)
          query_params["license_types"] = params[:license_types] if params.key?(:license_types)
          query_params["facility_type_codes"] = params[:facility_type_codes] if params.key?(:facility_type_codes)
          query_params["network_types"] = params[:network_types] if params.key?(:network_types)
          query_params["payer_plan_group_ids"] = params[:payer_plan_group_ids] if params.key?(:payer_plan_group_ids)
          query_params["cpt_code"] = params[:cpt_code] if params.key?(:cpt_code)
          query_params["modifiers"] = params[:modifiers] if params.key?(:modifiers)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/fee-schedules/v3/unique-dimension-values",
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
            Candid::FeeSchedules::V3::Types::DimensionsPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Gets every version of a rate.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::RateId] :rate_id
        #
        # @return [Array[Candid::FeeSchedules::V3::Types::Rate]]
        def get_rate_history(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/fee-schedules/v3/#{params[:rate_id]}/history",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end

        # Uploads a new fee schedule.
        #
        # Each rate may either be totally new as qualified by it's dimensions or a new version for an existing rate.
        #
        # If adding a new version to an existing rate, the rate must be posted with the next version number (previous
        # version + 1) or a EntityConflictError will
        # be returned.
        #
        # Use the dry run flag to discover already existing rates and to run validations.  If validations for any rate
        # fail, no rates will
        # be saved to the system.
        #
        # @param request_options [Hash]
        # @param params [Candid::FeeSchedules::V3::Types::FeeScheduleUploadRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Candid::FeeSchedules::V3::Types::Rate]]
        def upload_fee_schedule(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/fee-schedules/v3",
            body: Candid::FeeSchedules::V3::Types::FeeScheduleUploadRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end

        # Soft deletes a rate from the system.  Only the most recent version of a rate can be deleted.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::RateId] :rate_id
        # @option params [Integer] :version
        #
        # @return [untyped]
        def delete_rate(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "DELETE",
            path: "/api/fee-schedules/v3/#{params[:rate_id]}/#{params[:version]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end

        # Gets the default payer threshold
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::FeeSchedules::V3::Types::PayerThreshold]
        def get_payer_thresholds_default(request_options: {}, **params)
          Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/fee-schedules/v3/payer-threshold/default",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::FeeSchedules::V3::Types::PayerThreshold.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Gets a list of payers and thresholds by their uuids
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Payers::V3::Types::PayerUuid] :payer_uuids
        #
        # @return [Candid::FeeSchedules::V3::Types::PayerThresholdsPage]
        def get_payer_thresholds(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[payer_uuids]
          query_params = {}
          query_params["payer_uuids"] = params[:payer_uuids] if params.key?(:payer_uuids)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/fee-schedules/v3/payer-threshold",
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
            Candid::FeeSchedules::V3::Types::PayerThresholdsPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Sets the threshold information for a payer
        #
        # @param request_options [Hash]
        # @param params [Candid::FeeSchedules::V3::Types::PayerThreshold]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Payers::V3::Types::PayerUuid] :payer_uuid
        #
        # @return [Candid::FeeSchedules::V3::Types::PayerThreshold]
        def set_payer_threshold(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PUT",
            path: "/api/fee-schedules/v3/payer-threshold/#{params[:payer_uuid]}",
            body: Candid::FeeSchedules::V3::Types::PayerThreshold.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::FeeSchedules::V3::Types::PayerThreshold.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Hard deletes rates from the system that match the provided dimensions.  This is a destructive operation and
        # cannot be undone.  If an empty dimensions object is provided, all rates will be hard deleted.  The maximum
        # number of rates this API will delete at a time is 10000.  Returns the number of rates deleted and if that
        # number is the maximum, the caller should call this API again to continue deleting rates.
        #
        # @param request_options [Hash]
        # @param params [Candid::FeeSchedules::V3::Types::OptionalDimensions]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Integer]
        def hard_delete_rates(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/fee-schedules/v3/hard-delete",
            body: Candid::FeeSchedules::V3::Types::OptionalDimensions.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end

        # Hard deletes specific rates from the system by their IDs. This is a destructive operation and cannot be
        # undone. Limited to 100 rate IDs maximum per request. For bulk deletion of more than 100 rates, use the
        # hard_delete_rates endpoint with dimension filters. Returns the number of rates deleted.
        #
        # @param request_options [Hash]
        # @param params [Candid::FeeSchedules::V3::Types::HardDeleteRatesByIdsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Integer]
        def hard_delete_rates_by_ids(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/fee-schedules/v3/hard-delete-by-ids",
            body: Candid::FeeSchedules::V3::Types::HardDeleteRatesByIdsRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
