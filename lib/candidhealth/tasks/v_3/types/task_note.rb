# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module Tasks
    module V3
      module Types
        class TaskNote
          # @return [String]
          attr_reader :task_note_id
          # @return [String]
          attr_reader :text
          # @return [DateTime]
          attr_reader :created_at
          # @return [String]
          attr_reader :author_name
          # @return [String]
          attr_reader :author_organization_name
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param task_note_id [String]
          # @param text [String]
          # @param created_at [DateTime]
          # @param author_name [String]
          # @param author_organization_name [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Tasks::V3::Types::TaskNote]
          def initialize(task_note_id:, text:, created_at:, author_name:, author_organization_name:,
                         additional_properties: nil)
            @task_note_id = task_note_id
            @text = text
            @created_at = created_at
            @author_name = author_name
            @author_organization_name = author_organization_name
            @additional_properties = additional_properties
            @_field_set = {
              "task_note_id": task_note_id,
              "text": text,
              "created_at": created_at,
              "author_name": author_name,
              "author_organization_name": author_organization_name
            }
          end

          # Deserialize a JSON object to an instance of TaskNote
          #
          # @param json_object [String]
          # @return [CandidApiClient::Tasks::V3::Types::TaskNote]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            task_note_id = struct["task_note_id"]
            text = struct["text"]
            created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
            author_name = struct["author_name"]
            author_organization_name = struct["author_organization_name"]
            new(
              task_note_id: task_note_id,
              text: text,
              created_at: created_at,
              author_name: author_name,
              author_organization_name: author_organization_name,
              additional_properties: struct
            )
          end

          # Serialize an instance of TaskNote to a JSON object
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
            obj.task_note_id.is_a?(String) != false || raise("Passed value for field obj.task_note_id is not the expected type, validation failed.")
            obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
            obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
            obj.author_name.is_a?(String) != false || raise("Passed value for field obj.author_name is not the expected type, validation failed.")
            obj.author_organization_name.is_a?(String) != false || raise("Passed value for field obj.author_organization_name is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
