# frozen_string_literal: true

require_relative "encounter_attachment_type"
require "ostruct"
require "json"

module CandidApiClient
  module EncounterAttachments
    module V1
      module Types
        class EncounterAttachment
          # @return [String]
          attr_reader :encounter_id
          # @return [CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachmentType]
          attr_reader :attachment_type
          # @return [String]
          attr_reader :attachment_id
          # @return [String]
          attr_reader :file_name
          # @return [String]
          attr_reader :description
          # @return [String]
          attr_reader :content_type
          # @return [String]
          attr_reader :authed_url
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param encounter_id [String]
          # @param attachment_type [CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachmentType]
          # @param attachment_id [String]
          # @param file_name [String]
          # @param description [String]
          # @param content_type [String]
          # @param authed_url [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachment]
          def initialize(encounter_id:, attachment_type:, attachment_id:, file_name:, description:, content_type:,
                         authed_url:, additional_properties: nil)
            @encounter_id = encounter_id
            @attachment_type = attachment_type
            @attachment_id = attachment_id
            @file_name = file_name
            @description = description
            @content_type = content_type
            @authed_url = authed_url
            @additional_properties = additional_properties
            @_field_set = {
              "encounter_id": encounter_id,
              "attachment_type": attachment_type,
              "attachment_id": attachment_id,
              "file_name": file_name,
              "description": description,
              "content_type": content_type,
              "authed_url": authed_url
            }
          end

          # Deserialize a JSON object to an instance of EncounterAttachment
          #
          # @param json_object [String]
          # @return [CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachment]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            encounter_id = struct["encounter_id"]
            attachment_type = struct["attachment_type"]
            attachment_id = struct["attachment_id"]
            file_name = struct["file_name"]
            description = struct["description"]
            content_type = struct["content_type"]
            authed_url = struct["authed_url"]
            new(
              encounter_id: encounter_id,
              attachment_type: attachment_type,
              attachment_id: attachment_id,
              file_name: file_name,
              description: description,
              content_type: content_type,
              authed_url: authed_url,
              additional_properties: struct
            )
          end

          # Serialize an instance of EncounterAttachment to a JSON object
          #
          # @return [String]
          def to_json(*_args)
            @_field_set&.to_json
          end

          # Leveraged for Union-type generation, validate_raw attempts to parse the given
          #  hash and check each fields type against the current object's property
          #  definitions.
          #
          # @param obj [Object]
          # @return [Void]
          def self.validate_raw(obj:)
            obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
            obj.attachment_type.is_a?(CandidApiClient::EncounterAttachments::V1::Types::EncounterAttachmentType) != false || raise("Passed value for field obj.attachment_type is not the expected type, validation failed.")
            obj.attachment_id.is_a?(String) != false || raise("Passed value for field obj.attachment_id is not the expected type, validation failed.")
            obj.file_name.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
            obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.content_type.is_a?(String) != false || raise("Passed value for field obj.content_type is not the expected type, validation failed.")
            obj.authed_url.is_a?(String) != false || raise("Passed value for field obj.authed_url is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
