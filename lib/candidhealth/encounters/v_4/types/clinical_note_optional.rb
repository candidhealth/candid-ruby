# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class ClinicalNoteOptional
          # @return [String]
          attr_reader :text
          # @return [String]
          attr_reader :author_name
          # @return [String]
          attr_reader :author_npi
          # @return [DateTime]
          attr_reader :timestamp
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param text [String]
          # @param author_name [String]
          # @param author_npi [String]
          # @param timestamp [DateTime]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::ClinicalNoteOptional]
          def initialize(text: OMIT, author_name: OMIT, author_npi: OMIT, timestamp: OMIT, additional_properties: nil)
            @text = text if text != OMIT
            @author_name = author_name if author_name != OMIT
            @author_npi = author_npi if author_npi != OMIT
            @timestamp = timestamp if timestamp != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "text": text,
              "author_name": author_name,
              "author_npi": author_npi,
              "timestamp": timestamp
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ClinicalNoteOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::ClinicalNoteOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            text = struct["text"]
            author_name = struct["author_name"]
            author_npi = struct["author_npi"]
            timestamp = (DateTime.parse(parsed_json["timestamp"]) unless parsed_json["timestamp"].nil?)
            new(
              text: text,
              author_name: author_name,
              author_npi: author_npi,
              timestamp: timestamp,
              additional_properties: struct
            )
          end

          # Serialize an instance of ClinicalNoteOptional to a JSON object
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
            obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
            obj.author_name&.is_a?(String) != false || raise("Passed value for field obj.author_name is not the expected type, validation failed.")
            obj.author_npi&.is_a?(String) != false || raise("Passed value for field obj.author_npi is not the expected type, validation failed.")
            obj.timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
