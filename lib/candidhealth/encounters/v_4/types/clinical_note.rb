# frozen_string_literal: true

require_relative "../../../commons/types/npi"
require "date"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class ClinicalNote
        attr_reader :text, :author_name, :author_npi, :timestamp, :additional_properties

        # @param text [String]
        # @param author_name [String]
        # @param author_npi [Commons::NPI]
        # @param timestamp [DateTime]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::ClinicalNote]
        def initialize(text:, author_name:, timestamp:, author_npi: nil, additional_properties: nil)
          # @type [String]
          @text = text
          # @type [String]
          @author_name = author_name
          # @type [Commons::NPI]
          @author_npi = author_npi
          # @type [DateTime]
          @timestamp = timestamp
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ClinicalNote
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::ClinicalNote]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          text = struct.text
          author_name = struct.author_name
          author_npi = struct.author_npi
          timestamp = (DateTime.parse(parsed_json["timestamp"]) unless parsed_json["timestamp"].nil?)
          new(text: text, author_name: author_name, author_npi: author_npi, timestamp: timestamp,
              additional_properties: struct)
        end

        # Serialize an instance of ClinicalNote to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "text": @text, "author_name": @author_name, "author_npi": @author_npi, "timestamp": @timestamp }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
          obj.author_name.is_a?(String) != false || raise("Passed value for field obj.author_name is not the expected type, validation failed.")
          obj.author_npi&.is_a?(String) != false || raise("Passed value for field obj.author_npi is not the expected type, validation failed.")
          obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
        end
      end
    end
  end
end
