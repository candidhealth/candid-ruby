# frozen_string_literal: true

module Candid
  module EncounterAttachments
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

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::EncounterId] :encounter_id
        #
        # @return [Array[Candid::EncounterAttachments::V1::Types::EncounterAttachment]]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/encounter-attachments/v1/#{params[:encounter_id]}",
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

        # Uploads a file to the encounter. The file will be stored in the
        # encounter's attachments. Deprecated: Use create-v2 instead.
        #
        # @param request_options [Hash]
        # @param params [void]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::EncounterId] :encounter_id
        #
        # @return [String]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          body = Internal::Multipart::FormData.new

          body.add_part(params[:attachment_file].to_form_data_part(name: "attachment_file")) if params[:attachment_file]
          if params[:attachment_type]
            body.add(
              name: "attachment_type",
              value: params[:attachment_type]
            )
          end

          request = Candid::Internal::Multipart::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PUT",
            path: "/api/encounter-attachments/v1/#{params[:encounter_id]}",
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
            Candid::EncounterAttachments::V1::Types::AttachmentId.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Uploads a file to the encounter. The file will be stored in the
        # encounter's attachments.
        #
        # @param request_options [Hash]
        # @param params [void]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::EncounterId] :encounter_id
        #
        # @return [String]
        def create_with_description(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          body = Internal::Multipart::FormData.new

          body.add_part(params[:attachment_file].to_form_data_part(name: "attachment_file")) if params[:attachment_file]
          if params[:attachment_type]
            body.add(
              name: "attachment_type",
              value: params[:attachment_type]
            )
          end
          if params[:description]
            body.add(
              name: "description",
              value: params[:description]
            )
          end

          request = Candid::Internal::Multipart::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PUT",
            path: "/api/encounter-attachments/v1/#{params[:encounter_id]}/v2",
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
            Candid::EncounterAttachments::V1::Types::AttachmentId.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Uploads a file using an external identifier. For Charge Capture, the file will be associated with the
        # Encounter at Encounter creation time.
        #
        # Note: Attachments created via this endpoint are not searchable via the get endpoint until they are associated
        # with an encounter.
        #
        # @param request_options [Hash]
        # @param params [void]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [String]
        def create_with_charge_capture_external_id(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          body = Internal::Multipart::FormData.new

          if params[:charge_capture_external_id]
            body.add(
              name: "charge_capture_external_id",
              value: params[:charge_capture_external_id]
            )
          end
          body.add_part(params[:attachment_file].to_form_data_part(name: "attachment_file")) if params[:attachment_file]
          if params[:attachment_type]
            body.add(
              name: "attachment_type",
              value: params[:attachment_type]
            )
          end
          if params[:description]
            body.add(
              name: "description",
              value: params[:description]
            )
          end

          request = Candid::Internal::Multipart::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/encounter-attachments/v1/create-from-charge-capture-external-id",
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
            Candid::EncounterAttachments::V1::Types::AttachmentId.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns all attachments associated with the given charge capture external ID.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :charge_capture_external_id
        #
        # @return [Array[Candid::EncounterAttachments::V1::Types::ChargeCaptureAttachment]]
        def get_by_charge_capture_external_id(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/encounter-attachments/v1/by-charge-capture-external-id/#{params[:charge_capture_external_id]}",
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

        # Deletes an attachment associated with the given charge capture external ID.
        #
        # @param request_options [Hash]
        # @param params [Candid::EncounterAttachments::V1::Types::DeleteExternalAttachmentRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :charge_capture_external_id
        #
        # @return [untyped]
        def delete_by_charge_capture_external_id(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request_data = Candid::EncounterAttachments::V1::Types::DeleteExternalAttachmentRequest.new(params).to_h
          non_body_param_names = ["charge_capture_external_id"]
          body = request_data.except(*non_body_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "DELETE",
            path: "/api/encounter-attachments/v1/by-charge-capture-external-id/#{params[:charge_capture_external_id]}",
            body: body,
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

        # @param request_options [Hash]
        # @param params [Candid::EncounterAttachments::V1::Types::DeleteAttachmentRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::EncounterId] :encounter_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request_data = Candid::EncounterAttachments::V1::Types::DeleteAttachmentRequest.new(params).to_h
          non_body_param_names = ["encounter_id"]
          body = request_data.except(*non_body_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "DELETE",
            path: "/api/encounter-attachments/v1/#{params[:encounter_id]}",
            body: body,
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
