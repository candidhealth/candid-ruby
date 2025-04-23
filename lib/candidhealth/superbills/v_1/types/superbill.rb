# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module Superbills
    module V1
      module Types
        class Superbill
          # @return [String] Primary id of the superbill.
          attr_reader :superbill_id
          # @return [String] external_id of the patient.
          attr_reader :patient_external_id
          # @return [String] Authenticated URL for downloading the generated superbill file.
          attr_reader :authed_url
          # @return [Date] Minimum (inclusive) date selected for this superbill.
          attr_reader :date_range_min
          # @return [Date] Maximum (inclusive) date selected for this superbill.
          attr_reader :date_range_max
          # @return [String] Original filename of the superbill.
          attr_reader :file_name
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param superbill_id [String] Primary id of the superbill.
          # @param patient_external_id [String] external_id of the patient.
          # @param authed_url [String] Authenticated URL for downloading the generated superbill file.
          # @param date_range_min [Date] Minimum (inclusive) date selected for this superbill.
          # @param date_range_max [Date] Maximum (inclusive) date selected for this superbill.
          # @param file_name [String] Original filename of the superbill.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Superbills::V1::Types::Superbill]
          def initialize(superbill_id:, patient_external_id:, authed_url:, date_range_min:, date_range_max:,
                         file_name:, additional_properties: nil)
            @superbill_id = superbill_id
            @patient_external_id = patient_external_id
            @authed_url = authed_url
            @date_range_min = date_range_min
            @date_range_max = date_range_max
            @file_name = file_name
            @additional_properties = additional_properties
            @_field_set = {
              "superbill_id": superbill_id,
              "patient_external_id": patient_external_id,
              "authed_url": authed_url,
              "date_range_min": date_range_min,
              "date_range_max": date_range_max,
              "file_name": file_name
            }
          end

          # Deserialize a JSON object to an instance of Superbill
          #
          # @param json_object [String]
          # @return [CandidApiClient::Superbills::V1::Types::Superbill]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            superbill_id = struct["superbill_id"]
            patient_external_id = struct["patient_external_id"]
            authed_url = struct["authed_url"]
            date_range_min = (Date.parse(parsed_json["date_range_min"]) unless parsed_json["date_range_min"].nil?)
            date_range_max = (Date.parse(parsed_json["date_range_max"]) unless parsed_json["date_range_max"].nil?)
            file_name = struct["file_name"]
            new(
              superbill_id: superbill_id,
              patient_external_id: patient_external_id,
              authed_url: authed_url,
              date_range_min: date_range_min,
              date_range_max: date_range_max,
              file_name: file_name,
              additional_properties: struct
            )
          end

          # Serialize an instance of Superbill to a JSON object
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
            obj.superbill_id.is_a?(String) != false || raise("Passed value for field obj.superbill_id is not the expected type, validation failed.")
            obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.authed_url.is_a?(String) != false || raise("Passed value for field obj.authed_url is not the expected type, validation failed.")
            obj.date_range_min.is_a?(Date) != false || raise("Passed value for field obj.date_range_min is not the expected type, validation failed.")
            obj.date_range_max.is_a?(Date) != false || raise("Passed value for field obj.date_range_max is not the expected type, validation failed.")
            obj.file_name.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
