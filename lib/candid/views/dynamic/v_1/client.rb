# frozen_string_literal: true

module Candid
  module Views
    module Dynamic
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

          # Resolves a dynamic view to the EncounterSummaries currently present in this view.
          # Body parameters can include sorting controls.
          #
          # @param request_options [Hash]
          # @param params [Candid::Views::Dynamic::V1::Types::ResolveDynamicView]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::Views::Dynamic::V1::Types::ClaimDynamicViewId] :claim_dynamic_view_id
          #
          # @return [Candid::EncounterSummaries::V1::Types::EncounterSummaryPage]
          def resolve(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request_data = Candid::Views::Dynamic::V1::Types::ResolveDynamicView.new(params).to_h
            non_body_param_names = ["claim_dynamic_view_id"]
            body = request_data.except(*non_body_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
              method: "POST",
              path: "/api/claim-dynamic-views/v1/#{params[:claim_dynamic_view_id]}/resolve",
              body: body,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::EncounterSummaries::V1::Types::EncounterSummaryPage.load(response.body)
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
