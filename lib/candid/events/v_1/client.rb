# frozen_string_literal: true

module Candid
  module Events
    module V1
      class Client
        # @return [Candid::Events::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Scans the last 30 days of events. All results are sorted by created date, descending.
        #
        # @return [Candid::Events::V1::Types::EventScanPage]
        def scan(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[page_token limit event_types created_before created_after]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/events/v1/",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Events::V1::Types::EventScanPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::Events::V1::Types::Event]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/events/v1/#{params[:event_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Events::V1::Types::Event.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
