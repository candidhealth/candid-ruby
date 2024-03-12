# frozen_string_literal: true

require_relative "task_action"
require "json"

module CandidApiClient
  module Tasks
    module V3
      class TaskActions
        attr_reader :actions, :additional_properties

        # @param actions [Array<Tasks::V3::TaskAction>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Tasks::V3::TaskActions]
        def initialize(actions:, additional_properties: nil)
          # @type [Array<Tasks::V3::TaskAction>]
          @actions = actions
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of TaskActions
        #
        # @param json_object [JSON]
        # @return [Tasks::V3::TaskActions]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          actions = parsed_json["actions"]&.map do |v|
            v = v.to_json
            Tasks::V3::TaskAction.from_json(json_object: v)
          end
          new(actions: actions, additional_properties: struct)
        end

        # Serialize an instance of TaskActions to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "actions": @actions }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
