# frozen_string_literal: true

module Candid
  module EncounterAttachments
    module V1
      class Client
        # @return [Candid::EncounterAttachments::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Array[Candid::EncounterAttachments::V1::Types::EncounterAttachment]]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/encounter-attachments/v1/#{params[:encounter_id]}"
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

        # Uploads a file to the encounter. The file will be stored in the
        # encounter's attachments. Deprecated: Use create-v2 instead.
        #
        # @return [String]
        def create(request_options: {}, **params)
          body = Internal::Multipart::FormData.new

          body.add_part(params[:attachment_file].to_form_data_part(name: "attachment_file")) if params[:attachment_file]
          if params[:attachment_type]
            body.add(
              name: "attachment_type",
              value: params[:attachment_type]
            )
          end

          _request = Candid::Internal::Multipart::Request.new(
            method: PUT,
            path: "/api/encounter-attachments/v1/#{params[:encounter_id]}",
            body: body
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::EncounterAttachments::V1::Types::AttachmentId.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Uploads a file to the encounter. The file will be stored in the
        # encounter's attachments.
        #
        # @return [String]
        def create_with_description(request_options: {}, **params)
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

          _request = Candid::Internal::Multipart::Request.new(
            method: PUT,
            path: "/api/encounter-attachments/v1/#{params[:encounter_id]}/v2",
            body: body
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::EncounterAttachments::V1::Types::AttachmentId.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Uploads a file using an external identifier. For Charge Capture, the file will be associated with the Encounter at Encounter creation time.
        #
        # Note: Attachments created via this endpoint are not searchable via the get endpoint until they are associated with an encounter.
        #
        # @return [String]
        def create_with_charge_capture_external_id(request_options: {}, **params)
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

          _request = Candid::Internal::Multipart::Request.new(
            method: POST,
            path: "/api/encounter-attachments/v1/create-from-charge-capture-external-id",
            body: body
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::EncounterAttachments::V1::Types::AttachmentId.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [untyped]
        def delete(request_options: {}, **params)
          _path_param_names = ["encounter_id"]

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/encounter-attachments/v1/#{params[:encounter_id]}",
            body: params.except(*_path_param_names)
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
