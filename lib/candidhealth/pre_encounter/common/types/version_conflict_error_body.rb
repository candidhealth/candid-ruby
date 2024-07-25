# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        class VersionConflictErrorBody
          # @return [String]
          attr_reader :code
          # @return [Integer]
          attr_reader :latest_version
          # @return [String]
          attr_reader :message
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param code [String]
          # @param latest_version [Integer]
          # @param message [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::VersionConflictErrorBody]
          def initialize(code:, latest_version:, message:, additional_properties: nil)
            @code = code
            @latest_version = latest_version
            @message = message
            @additional_properties = additional_properties
            @_field_set = { "code": code, "latest_version": latest_version, "message": message }
          end

          # Deserialize a JSON object to an instance of VersionConflictErrorBody
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::VersionConflictErrorBody]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            code = struct["code"]
            latest_version = struct["latest_version"]
            message = struct["message"]
            new(
              code: code,
              latest_version: latest_version,
              message: message,
              additional_properties: struct
            )
          end

          # Serialize an instance of VersionConflictErrorBody to a JSON object
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
            obj.code.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
            obj.latest_version.is_a?(Integer) != false || raise("Passed value for field obj.latest_version is not the expected type, validation failed.")
            obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
