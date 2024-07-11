# frozen_string_literal: true

require_relative "rate_upload"
require_relative "rate"
require_relative "validation_error"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        class RateUploadWithPossibleErrors
          # @return [CandidApiClient::FeeSchedules::V3::Types::RateUpload]
          attr_reader :rate_upload
          # @return [CandidApiClient::FeeSchedules::V3::Types::Rate]
          attr_reader :existing_rate
          # @return [Array<CandidApiClient::FeeSchedules::V3::Types::ValidationError>]
          attr_reader :possible_errors
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param rate_upload [CandidApiClient::FeeSchedules::V3::Types::RateUpload]
          # @param existing_rate [CandidApiClient::FeeSchedules::V3::Types::Rate]
          # @param possible_errors [Array<CandidApiClient::FeeSchedules::V3::Types::ValidationError>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::RateUploadWithPossibleErrors]
          def initialize(rate_upload:, possible_errors:, existing_rate: OMIT, additional_properties: nil)
            @rate_upload = rate_upload
            @existing_rate = existing_rate if existing_rate != OMIT
            @possible_errors = possible_errors
            @additional_properties = additional_properties
            @_field_set = {
              "rate_upload": rate_upload,
              "existing_rate": existing_rate,
              "possible_errors": possible_errors
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of RateUploadWithPossibleErrors
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::RateUploadWithPossibleErrors]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["rate_upload"].nil?
              rate_upload = nil
            else
              rate_upload = parsed_json["rate_upload"].to_json
              rate_upload = CandidApiClient::FeeSchedules::V3::Types::RateUpload.from_json(json_object: rate_upload)
            end
            if parsed_json["existing_rate"].nil?
              existing_rate = nil
            else
              existing_rate = parsed_json["existing_rate"].to_json
              existing_rate = CandidApiClient::FeeSchedules::V3::Types::Rate.from_json(json_object: existing_rate)
            end
            possible_errors = parsed_json["possible_errors"]&.map do |item|
              item = item.to_json
              CandidApiClient::FeeSchedules::V3::Types::ValidationError.from_json(json_object: item)
            end
            new(
              rate_upload: rate_upload,
              existing_rate: existing_rate,
              possible_errors: possible_errors,
              additional_properties: struct
            )
          end

          # Serialize an instance of RateUploadWithPossibleErrors to a JSON object
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
            CandidApiClient::FeeSchedules::V3::Types::RateUpload.validate_raw(obj: obj.rate_upload)
            obj.existing_rate.nil? || CandidApiClient::FeeSchedules::V3::Types::Rate.validate_raw(obj: obj.existing_rate)
            obj.possible_errors.is_a?(Array) != false || raise("Passed value for field obj.possible_errors is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
