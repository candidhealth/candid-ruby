# frozen_string_literal: true

module Candid
  module PreEncounter
    module Lists
      module V1
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

          # Gets patients with dependent objects for patients that match the query parameters.
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
          # @option params [String, nil] :sort_field
          # @option params [Candid::PreEncounter::Common::Types::SortDirection, nil] :sort_direction
          # @option params [String, nil] :filters
          # @option params [Boolean, nil] :include_deactivated
          # @option params [Boolean, nil] :redirect_to_primary
          #
          # @return [Candid::PreEncounter::Lists::V1::Types::PatientListPage]
          def get_patient_list(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[page_token limit sort_field sort_direction filters include_deactivated redirect_to_primary]
            query_params = {}
            query_params["page_token"] = params[:page_token] if params.key?(:page_token)
            query_params["limit"] = params[:limit] if params.key?(:limit)
            query_params["sort_field"] = params[:sort_field] if params.key?(:sort_field)
            query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
            query_params["filters"] = params[:filters] if params.key?(:filters)
            query_params["include_deactivated"] = params[:include_deactivated] if params.key?(:include_deactivated)
            query_params["redirect_to_primary"] = params[:redirect_to_primary] if params.key?(:redirect_to_primary)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/lists/v1/patient",
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
              Candid::PreEncounter::Lists::V1::Types::PatientListPage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Searches for appointments that match the query parameters.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String, nil] :sort_field
          # @option params [Candid::PreEncounter::Common::Types::SortDirection, nil] :sort_direction
          # @option params [Integer, nil] :limit
          # @option params [String, nil] :page_token
          # @option params [String, nil] :filters
          # @option params [Boolean, nil] :include_deactivated
          # @option params [Boolean, nil] :include_merged_patient_data
          #
          # @return [Candid::PreEncounter::Lists::V1::Types::AppointmentListPage]
          def get_appointment_list(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[sort_field sort_direction limit page_token filters include_deactivated include_merged_patient_data]
            query_params = {}
            query_params["sort_field"] = params[:sort_field] if params.key?(:sort_field)
            query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
            query_params["limit"] = params[:limit] if params.key?(:limit)
            query_params["page_token"] = params[:page_token] if params.key?(:page_token)
            query_params["filters"] = params[:filters] if params.key?(:filters)
            query_params["include_deactivated"] = params[:include_deactivated] if params.key?(:include_deactivated)
            query_params["include_merged_patient_data"] = params[:include_merged_patient_data] if params.key?(:include_merged_patient_data)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/lists/v1/appointment",
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
              Candid::PreEncounter::Lists::V1::Types::AppointmentListPage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end
      end
    end
  end
end
