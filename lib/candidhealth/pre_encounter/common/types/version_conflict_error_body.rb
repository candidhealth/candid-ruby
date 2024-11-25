# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        class VersionConflictErrorBody
          # @return [Integer]
          attr_reader :latest_version
          # @return [String]
          attr_reader :message
          # @return [Object]
          attr_reader :data
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param latest_version [Integer]
          # @param message [String]
          # @param data [Object]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::VersionConflictErrorBody]
          def initialize(message:, latest_version: OMIT, data: OMIT, additional_properties: nil)
            @latest_version = latest_version if latest_version != OMIT
            @message = message
            @data = data if data != OMIT
            @additional_properties = additional_properties
            @_field_set = { "latest_version": latest_version, "message": message, "data": data }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of VersionConflictErrorBody
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::VersionConflictErrorBody]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            latest_version = struct["latest_version"]
            message = struct["message"]
            data = struct["data"]
            new(
              latest_version: latest_version,
              message: message,
              data: data,
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
            obj.latest_version&.is_a?(Integer) != false || raise("Passed value for field obj.latest_version is not the expected type, validation failed.")
            obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
            obj.data&.is_a?(Object) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
