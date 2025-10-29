# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        class Client
          # @return [Candid::PreEncounter::Appointments::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Adds an appointment.  VersionConflictError is returned when the placer_appointment_id is already in use.
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::Appointment]
          def create(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/appointments/v1",
              body: Candid::PreEncounter::Appointments::V1::Types::MutableAppointment.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Appointments::V1::Types::Appointment.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Gets all Visits within a given time range. The return list is ordered by start_time ascending.
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::VisitsPage]
          def get_visits(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[page_token limit sort_field sort_direction filters]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/appointments/v1/visits",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Appointments::V1::Types::VisitsPage.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Gets an appointment.
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::Appointment]
          def get(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/appointments/v1/#{params[:id]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Appointments::V1::Types::Appointment.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Gets an appointment along with it's full history.  The return list is ordered by version ascending.
          #
          # @return [Array[Candid::PreEncounter::Appointments::V1::Types::Appointment]]
          def get_history(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/appointments/v1/#{params[:id]}/history"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end

          # Updates an appointment. The path must contain the next version number to prevent race conditions. For example, if the current version of the appointment is n, you will need to send a request to this endpoint with `/{id}/n+1` to update the appointment. Updating historic versions is not supported.
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::Appointment]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "PUT",
              path: "/appointments/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Appointments::V1::Types::MutableAppointment.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Appointments::V1::Types::Appointment.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Scans up to 100 appointment updates.  The since query parameter is inclusive, and the result list is ordered by updatedAt ascending.
          #
          # @return [Array[Candid::PreEncounter::Appointments::V1::Types::Appointment]]
          def scan(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[since]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/appointments/v1/updates/scan",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end

          # Sets an appointment as deactivated.  The path must contain the most recent version to prevent race conditions.  Deactivating historic versions is not supported. Subsequent updates via PUT to the appointment will "reactivate" the appointment and set the deactivated flag to false.
          #
          # @return [untyped]
          def deactivate(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "DELETE",
              path: "/appointments/v1/#{params[:id]}/#{params[:version]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
