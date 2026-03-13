# frozen_string_literal: true

module Candid
  module Exports
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

        # <Warning>
        # API-based exports are in the process of being deprecated in favor of Candid Data Share and are not being
        # offered to new customers.
        # Please see the [Candid Data Share docs](https://docs.joincandidhealth.com/introduction/candid-data-share) for
        # more information.
        # </Warning>
        #
        # Retrieve CSV-formatted reports on claim submissions and outcomes. This endpoint returns Export objects that
        # contain an
        # authenticated URL to a customer's reports with a 2min TTL. The schema for the CSV export can be found
        # [here](https://app.joincandidhealth.com/files/exports_schema.csv).
        #
        # **Schema changes:** Changing column order, removing columns, or changing the name of a column is considered a
        # [Breaking Change](../../../api-principles/breaking-changes). Adding new columns to the end of the Exports file
        # is not considered a
        # Breaking Change and happens periodically. For this reason, it is important that any downstream automation or
        # processes built on top
        # of Candid Health's export files be resilient to the addition of new columns at the end of the file.
        #
        # **SLA guarantees:** Files for a given date are guaranteed to be available after 3 business days. For example,
        # Friday's file will be
        # available by Wednesday at the latest. If file generation is still in progress upon request before 3 business
        # days have passed, the
        # caller will receive a 422 response. If the file has already been generated, it will be served. Historic files
        # should be available
        # up to 90 days in the past by default. Please email our [Support team](mailto:support@joincandidhealth.com)
        # with any data requests
        # outside of these stated guarantees.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :start_date
        # @option params [String] :end_date
        #
        # @return [Candid::Exports::V3::Types::GetExportsResponse]
        def get_exports(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[start_date end_date]
          query_params = {}
          query_params["start_date"] = params[:start_date] if params.key?(:start_date)
          query_params["end_date"] = params[:end_date] if params.key?(:end_date)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/exports/v3",
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
            Candid::Exports::V3::Types::GetExportsResponse.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
