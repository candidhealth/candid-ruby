# frozen_string_literal: true

module Candid
  module PreEncounter
    module Lists
      module V1
        class Client
          # @return [Candid::PreEncounter::Lists::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Gets patients with dependent objects for patients that match the query parameters.
          #
          # @return [Candid::PreEncounter::Lists::V1::Types::PatientListPage]
          def get_patient_list(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[page_token limit sort_field sort_direction filters]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/lists/v1/patient",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Lists::V1::Types::PatientListPage.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Searches for appointments that match the query parameters.
          #
          # @return [Candid::PreEncounter::Lists::V1::Types::AppointmentListPage]
          def get_appointment_list(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[sort_field sort_direction limit page_token filters]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/lists/v1/appointment",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Lists::V1::Types::AppointmentListPage.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end
        end
      end
    end
  end
end
