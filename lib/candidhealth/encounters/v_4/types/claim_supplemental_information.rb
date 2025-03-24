# frozen_string_literal: true

require_relative "report_type_code"
require_relative "report_transmission_code"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class ClaimSupplementalInformation
          # @return [CandidApiClient::Encounters::V4::Types::ReportTypeCode]
          attr_reader :attachment_report_type_code
          # @return [CandidApiClient::Encounters::V4::Types::ReportTransmissionCode]
          attr_reader :attachment_transmission_code
          # @return [String]
          attr_reader :attachment_control_number
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param attachment_report_type_code [CandidApiClient::Encounters::V4::Types::ReportTypeCode]
          # @param attachment_transmission_code [CandidApiClient::Encounters::V4::Types::ReportTransmissionCode]
          # @param attachment_control_number [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation]
          def initialize(attachment_report_type_code:, attachment_transmission_code:, attachment_control_number: OMIT,
                         additional_properties: nil)
            @attachment_report_type_code = attachment_report_type_code
            @attachment_transmission_code = attachment_transmission_code
            @attachment_control_number = attachment_control_number if attachment_control_number != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "attachment_report_type_code": attachment_report_type_code,
              "attachment_transmission_code": attachment_transmission_code,
              "attachment_control_number": attachment_control_number
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ClaimSupplementalInformation
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            attachment_report_type_code = struct["attachment_report_type_code"]
            attachment_transmission_code = struct["attachment_transmission_code"]
            attachment_control_number = struct["attachment_control_number"]
            new(
              attachment_report_type_code: attachment_report_type_code,
              attachment_transmission_code: attachment_transmission_code,
              attachment_control_number: attachment_control_number,
              additional_properties: struct
            )
          end

          # Serialize an instance of ClaimSupplementalInformation to a JSON object
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
            obj.attachment_report_type_code.is_a?(CandidApiClient::Encounters::V4::Types::ReportTypeCode) != false || raise("Passed value for field obj.attachment_report_type_code is not the expected type, validation failed.")
            obj.attachment_transmission_code.is_a?(CandidApiClient::Encounters::V4::Types::ReportTransmissionCode) != false || raise("Passed value for field obj.attachment_transmission_code is not the expected type, validation failed.")
            obj.attachment_control_number&.is_a?(String) != false || raise("Passed value for field obj.attachment_control_number is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
