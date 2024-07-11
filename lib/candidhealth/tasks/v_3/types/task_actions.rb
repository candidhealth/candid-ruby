# frozen_string_literal: true

require_relative "task_action"
require "ostruct"
require "json"

module CandidApiClient
  module Tasks
    module V3
      module Types
        class TaskActions
          # @return [Array<CandidApiClient::Tasks::V3::Types::TaskAction>]
          attr_reader :actions
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param actions [Array<CandidApiClient::Tasks::V3::Types::TaskAction>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Tasks::V3::Types::TaskActions]
          def initialize(actions:, additional_properties: nil)
            @actions = actions
            @additional_properties = additional_properties
            @_field_set = { "actions": actions }
          end

          # Deserialize a JSON object to an instance of TaskActions
          #
          # @param json_object [String]
          # @return [CandidApiClient::Tasks::V3::Types::TaskActions]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            actions = parsed_json["actions"]&.map do |item|
              item = item.to_json
              CandidApiClient::Tasks::V3::Types::TaskAction.from_json(json_object: item)
            end
            new(actions: actions, additional_properties: struct)
          end

          # Serialize an instance of TaskActions to a JSON object
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
            obj.actions.is_a?(Array) != false || raise("Passed value for field obj.actions is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
