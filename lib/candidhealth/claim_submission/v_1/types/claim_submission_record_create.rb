# frozen_string_literal: true

require "date"
require_relative "claim_frequency_type_code"
require_relative "../../../commons/types/claim_submission_payer_responsibility_type"
require "json"

module CandidApiClient
  module ClaimSubmission
    module V1
      # Data about each external submission.
      class ClaimSubmissionRecordCreate
        attr_reader :submitted_at, :claim_frequency_code, :payer_responsibility, :additional_properties

        # @param submitted_at [DateTime] When the claim was submitted to the payer.
        # @param claim_frequency_code [ClaimSubmission::V1::ClaimFrequencyTypeCode]
        # @param payer_responsibility [Commons::ClaimSubmissionPayerResponsibilityType]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ClaimSubmission::V1::ClaimSubmissionRecordCreate]
        def initialize(submitted_at:, claim_frequency_code: nil, payer_responsibility: nil, additional_properties: nil)
          # @type [DateTime] When the claim was submitted to the payer.
          @submitted_at = submitted_at
          # @type [ClaimSubmission::V1::ClaimFrequencyTypeCode]
          @claim_frequency_code = claim_frequency_code
          # @type [Commons::ClaimSubmissionPayerResponsibilityType]
          @payer_responsibility = payer_responsibility
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ClaimSubmissionRecordCreate
        #
        # @param json_object [JSON]
        # @return [ClaimSubmission::V1::ClaimSubmissionRecordCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          submitted_at = (DateTime.parse(parsed_json["submitted_at"]) unless parsed_json["submitted_at"].nil?)
          claim_frequency_code = struct.claim_frequency_code
          payer_responsibility = struct.payer_responsibility
          new(submitted_at: submitted_at, claim_frequency_code: claim_frequency_code,
              payer_responsibility: payer_responsibility, additional_properties: struct)
        end

        # Serialize an instance of ClaimSubmissionRecordCreate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "submitted_at": @submitted_at,
            "claim_frequency_code": @claim_frequency_code,
            "payer_responsibility": @payer_responsibility
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.submitted_at.is_a?(DateTime) != false || raise("Passed value for field obj.submitted_at is not the expected type, validation failed.")
          obj.claim_frequency_code&.is_a?(ClaimSubmission::V1::ClaimFrequencyTypeCode) != false || raise("Passed value for field obj.claim_frequency_code is not the expected type, validation failed.")
          obj.payer_responsibility&.is_a?(Commons::ClaimSubmissionPayerResponsibilityType) != false || raise("Passed value for field obj.payer_responsibility is not the expected type, validation failed.")
        end
      end
    end
  end
end
