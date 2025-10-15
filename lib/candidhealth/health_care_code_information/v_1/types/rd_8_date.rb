# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        class Rd8Date
          # @return [DateTime] An [RFC 3339, section 5.6 datetime](https://ijmacd.github.io/rfc3339-iso8601/).
          #  For example, 2017-07-21T17:32:28Z.
          #  In practice, only the date portion of this is used for claim submission, so
          #  midnight time is fine.
          attr_reader :start
          # @return [DateTime] An [RFC 3339, section 5.6 datetime](https://ijmacd.github.io/rfc3339-iso8601/).
          #  For example, 2017-07-21T17:32:28Z.
          #  In practice, only the date portion of this is used for claim submission, so
          #  midnight time is fine.
          attr_reader :end_
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param start [DateTime] An [RFC 3339, section 5.6 datetime](https://ijmacd.github.io/rfc3339-iso8601/).
          #  For example, 2017-07-21T17:32:28Z.
          #  In practice, only the date portion of this is used for claim submission, so
          #  midnight time is fine.
          # @param end_ [DateTime] An [RFC 3339, section 5.6 datetime](https://ijmacd.github.io/rfc3339-iso8601/).
          #  For example, 2017-07-21T17:32:28Z.
          #  In practice, only the date portion of this is used for claim submission, so
          #  midnight time is fine.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::Rd8Date]
          def initialize(start:, end_:, additional_properties: nil)
            @start = start
            @end_ = end_
            @additional_properties = additional_properties
            @_field_set = { "start": start, "end": end_ }
          end

          # Deserialize a JSON object to an instance of Rd8Date
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::Rd8Date]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            start = (DateTime.parse(parsed_json["start"]) unless parsed_json["start"].nil?)
            end_ = (DateTime.parse(parsed_json["end"]) unless parsed_json["end"].nil?)
            new(
              start: start,
              end_: end_,
              additional_properties: struct
            )
          end

          # Serialize an instance of Rd8Date to a JSON object
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
            obj.start.is_a?(DateTime) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
            obj.end_.is_a?(DateTime) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
