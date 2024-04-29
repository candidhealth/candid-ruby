# frozen_string_literal: true

require_relative "rate_upload"
require_relative "rate"
require_relative "validation_error"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      class RateUploadWithPossibleErrors
        attr_reader :rate_upload, :existing_rate, :possible_errors, :additional_properties

        # @param rate_upload [FeeSchedules::V3::RateUpload]
        # @param existing_rate [FeeSchedules::V3::Rate]
        # @param possible_errors [Array<FeeSchedules::V3::ValidationError>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::RateUploadWithPossibleErrors]
        def initialize(rate_upload:, possible_errors:, existing_rate: nil, additional_properties: nil)
          # @type [FeeSchedules::V3::RateUpload]
          @rate_upload = rate_upload
          # @type [FeeSchedules::V3::Rate]
          @existing_rate = existing_rate
          # @type [Array<FeeSchedules::V3::ValidationError>]
          @possible_errors = possible_errors
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of RateUploadWithPossibleErrors
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::RateUploadWithPossibleErrors]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["rate_upload"].nil?
            rate_upload = nil
          else
            rate_upload = parsed_json["rate_upload"].to_json
            rate_upload = FeeSchedules::V3::RateUpload.from_json(json_object: rate_upload)
          end
          if parsed_json["existing_rate"].nil?
            existing_rate = nil
          else
            existing_rate = parsed_json["existing_rate"].to_json
            existing_rate = FeeSchedules::V3::Rate.from_json(json_object: existing_rate)
          end
          possible_errors = parsed_json["possible_errors"]&.map do |v|
            v = v.to_json
            FeeSchedules::V3::ValidationError.from_json(json_object: v)
          end
          new(rate_upload: rate_upload, existing_rate: existing_rate, possible_errors: possible_errors,
              additional_properties: struct)
        end

        # Serialize an instance of RateUploadWithPossibleErrors to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "rate_upload": @rate_upload, "existing_rate": @existing_rate, "possible_errors": @possible_errors }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          FeeSchedules::V3::RateUpload.validate_raw(obj: obj.rate_upload)
          obj.existing_rate.nil? || FeeSchedules::V3::Rate.validate_raw(obj: obj.existing_rate)
          obj.possible_errors.is_a?(Array) != false || raise("Passed value for field obj.possible_errors is not the expected type, validation failed.")
        end
      end
    end
  end
end
