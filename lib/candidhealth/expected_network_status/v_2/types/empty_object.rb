# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class EmptyObject
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::EmptyObject]
          def initialize(additional_properties: nil)
            @additional_properties = additional_properties
            @_field_set = {}
          end

          # Deserialize a JSON object to an instance of EmptyObject
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::EmptyObject]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            new(additional_properties: struct)
          end

          # Serialize an instance of EmptyObject to a JSON object
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
          def self.validate_raw(obj:); end
        end
      end
    end
  end
end
