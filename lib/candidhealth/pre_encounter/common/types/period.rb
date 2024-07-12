# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        class Period
          # @return [Date]
          attr_reader :start
          # @return [Date]
          attr_reader :end_
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param start [Date]
          # @param end_ [Date]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::Period]
          def initialize(start: OMIT, end_: OMIT, additional_properties: nil)
            @start = start if start != OMIT
            @end_ = end_ if end_ != OMIT
            @additional_properties = additional_properties
            @_field_set = { "start": start, "end": end_ }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of Period
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::Period]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            start = (Date.parse(parsed_json["start"]) unless parsed_json["start"].nil?)
            end_ = (Date.parse(parsed_json["end"]) unless parsed_json["end"].nil?)
            new(
              start: start,
              end_: end_,
              additional_properties: struct
            )
          end

          # Serialize an instance of Period to a JSON object
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
            obj.start&.is_a?(Date) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
            obj.end_&.is_a?(Date) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
