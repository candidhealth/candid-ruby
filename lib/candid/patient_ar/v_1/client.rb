# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      class Client
        # @return [Candid::PatientAr::V1::Client]
        def initialize(client:)
          @client = client
        end

        # NOTE: This service is in-development and can only be used by select partners. Please contact Candid Health to request access.
        #
        # Retrieve a list of inventory records based on the provided filters. Each inventory record provides the latest invoiceable status of the associated claim.
        # The response is paginated, and the `page_token` can be used to retrieve subsequent pages. Initial requests should not include `page_token`.
        #
        # @return [Candid::PatientAr::V1::Types::ListInventoryPagedResponse]
        def list_inventory(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[since limit page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/patient-ar/v1/inventory",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PatientAr::V1::Types::ListInventoryPagedResponse.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # NOTE: This service is in-development and can only be used by select partners. Please contact Candid Health to request access.
        #
        # Provides detailed itemization of invoice data for a specific claim.
        #
        # @return [Candid::PatientAr::V1::Types::InvoiceItemizationResponse]
        def itemize(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/patient-ar/v1/invoice-itemization/#{params[:claim_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::PatientAr::V1::Types::InvoiceItemizationResponse.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
