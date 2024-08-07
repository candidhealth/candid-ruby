# frozen_string_literal: true

require "json"

module CandidApiClient
  module Tasks
    module V3
      module Types
        class TaskActionExecutionMethod
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::Tasks::V3::Types::TaskActionExecutionMethod]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of TaskActionExecutionMethod
          #
          # @param json_object [String]
          # @return [CandidApiClient::Tasks::V3::Types::TaskActionExecutionMethod]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "close_task"
                       nil
                     else
                       json_object
                     end
            new(member: member, discriminant: struct.type)
          end

          # For Union Types, to_json functionality is delegated to the wrapped member.
          #
          # @return [String]
          def to_json(*_args)
            case @discriminant
            when "close_task"
              { type: @discriminant }.to_json
            else
              { "type": @discriminant, value: @member }.to_json
            end
            @member.to_json
          end

          # Leveraged for Union-type generation, validate_raw attempts to parse the given
          #  hash and check each fields type against the current object's property
          #  definitions.
          #
          # @param obj [Object]
          # @return [Void]
          def self.validate_raw(obj:)
            case obj.type
            when "close_task"
              # noop
            else
              raise("Passed value matched no type within the union, validation failed.")
            end
          end

          # For Union Types, is_a? functionality is delegated to the wrapped member.
          #
          # @param obj [Object]
          # @return [Boolean]
          def is_a?(obj)
            @member.is_a?(obj)
          end

          # @return [CandidApiClient::Tasks::V3::Types::TaskActionExecutionMethod]
          def self.close_task
            new(member: nil, discriminant: "close_task")
          end
        end
      end
    end
  end
end
