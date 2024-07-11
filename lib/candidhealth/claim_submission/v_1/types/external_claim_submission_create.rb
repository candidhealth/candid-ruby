# frozen_string_literal: true

require "date"
require_relative "claim_submission_record_create"
require "ostruct"
require "json"

module CandidApiClient
  module ClaimSubmission
    module V1
      module Types
        class ExternalClaimSubmissionCreate
          # @return [DateTime] When the claim was created in the external system.
          attr_reader :claim_created_at
          # @return [String] The Patient Control Number sent on the claim to the payer. To guarantee
          #  compatibility with all payers, this field must consist
          #  only of uppercase letters and numbers and be no more than 14 characters long.
          attr_reader :patient_control_number
          # @return [Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreate>] A successful claim submission record will be created for each value provided.
          #  An empty list may be provided for cases where the claim originated in an
          #  external system but was never submitted to a payer.
          attr_reader :submission_records
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param claim_created_at [DateTime] When the claim was created in the external system.
          # @param patient_control_number [String] The Patient Control Number sent on the claim to the payer. To guarantee
          #  compatibility with all payers, this field must consist
          #  only of uppercase letters and numbers and be no more than 14 characters long.
          # @param submission_records [Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreate>] A successful claim submission record will be created for each value provided.
          #  An empty list may be provided for cases where the claim originated in an
          #  external system but was never submitted to a payer.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate]
          def initialize(claim_created_at:, patient_control_number:, submission_records:, additional_properties: nil)
            @claim_created_at = claim_created_at
            @patient_control_number = patient_control_number
            @submission_records = submission_records
            @additional_properties = additional_properties
            @_field_set = {
              "claim_created_at": claim_created_at,
              "patient_control_number": patient_control_number,
              "submission_records": submission_records
            }
          end

          # Deserialize a JSON object to an instance of ExternalClaimSubmissionCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            claim_created_at = unless parsed_json["claim_created_at"].nil?
                                 DateTime.parse(parsed_json["claim_created_at"])
                               end
            patient_control_number = struct["patient_control_number"]
            submission_records = parsed_json["submission_records"]&.map do |item|
              item = item.to_json
              CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreate.from_json(json_object: item)
            end
            new(
              claim_created_at: claim_created_at,
              patient_control_number: patient_control_number,
              submission_records: submission_records,
              additional_properties: struct
            )
          end

          # Serialize an instance of ExternalClaimSubmissionCreate to a JSON object
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
            obj.claim_created_at.is_a?(DateTime) != false || raise("Passed value for field obj.claim_created_at is not the expected type, validation failed.")
            obj.patient_control_number.is_a?(String) != false || raise("Passed value for field obj.patient_control_number is not the expected type, validation failed.")
            obj.submission_records.is_a?(Array) != false || raise("Passed value for field obj.submission_records is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
