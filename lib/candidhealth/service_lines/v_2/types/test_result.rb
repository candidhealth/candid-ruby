# frozen_string_literal: true

require "json"

module CandidApiClient
  module ServiceLines
    module V2
      module Types
        class TestResult
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::ServiceLines::V2::Types::TestResult]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of TestResult
          #
          # @param json_object [String]
          # @return [CandidApiClient::ServiceLines::V2::Types::TestResult]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "hematocrit"
                       json_object.value
                     when "hemoglobin"
                       json_object.value
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
            when "hematocrit"
            when "hemoglobin"
            end
            { "type": @discriminant, "value": @member }.to_json
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
            when "hematocrit"
              obj.is_a?(Float) != false || raise("Passed value for field obj is not the expected type, validation failed.")
            when "hemoglobin"
              obj.is_a?(Float) != false || raise("Passed value for field obj is not the expected type, validation failed.")
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

          # @param member [Float]
          # @return [CandidApiClient::ServiceLines::V2::Types::TestResult]
          def self.hematocrit(member:)
            new(member: member, discriminant: "hematocrit")
          end

          # @param member [Float]
          # @return [CandidApiClient::ServiceLines::V2::Types::TestResult]
          def self.hemoglobin(member:)
            new(member: member, discriminant: "hemoglobin")
          end
        end
      end
    end
  end
end
