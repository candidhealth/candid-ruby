# frozen_string_literal: true

require "date"
require_relative "claim_frequency_type_code"
require_relative "../../../commons/types/claim_submission_payer_responsibility_type"
require_relative "../../../commons/types/intended_submission_medium"
require "ostruct"
require "json"

module CandidApiClient
  module ClaimSubmission
    module V1
      module Types
        # Data about each external submission.
        class ClaimSubmissionRecordCreateOptional
          # @return [DateTime] When the claim was submitted to the payer.
          attr_reader :submitted_at
          # @return [CandidApiClient::ClaimSubmission::V1::Types::ClaimFrequencyTypeCode]
          attr_reader :claim_frequency_code
          # @return [CandidApiClient::Commons::Types::ClaimSubmissionPayerResponsibilityType]
          attr_reader :payer_responsibility
          # @return [CandidApiClient::Commons::Types::IntendedSubmissionMedium] The medium by which the claim was submitted to the payer: paper or electronic.
          #  If omitted, defaults to electronic.
          attr_reader :intended_submission_medium
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param submitted_at [DateTime] When the claim was submitted to the payer.
          # @param claim_frequency_code [CandidApiClient::ClaimSubmission::V1::Types::ClaimFrequencyTypeCode]
          # @param payer_responsibility [CandidApiClient::Commons::Types::ClaimSubmissionPayerResponsibilityType]
          # @param intended_submission_medium [CandidApiClient::Commons::Types::IntendedSubmissionMedium] The medium by which the claim was submitted to the payer: paper or electronic.
          #  If omitted, defaults to electronic.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreateOptional]
          def initialize(submitted_at: OMIT, claim_frequency_code: OMIT, payer_responsibility: OMIT,
                         intended_submission_medium: OMIT, additional_properties: nil)
            @submitted_at = submitted_at if submitted_at != OMIT
            @claim_frequency_code = claim_frequency_code if claim_frequency_code != OMIT
            @payer_responsibility = payer_responsibility if payer_responsibility != OMIT
            @intended_submission_medium = intended_submission_medium if intended_submission_medium != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "submitted_at": submitted_at,
              "claim_frequency_code": claim_frequency_code,
              "payer_responsibility": payer_responsibility,
              "intended_submission_medium": intended_submission_medium
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ClaimSubmissionRecordCreateOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreateOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            submitted_at = (DateTime.parse(parsed_json["submitted_at"]) unless parsed_json["submitted_at"].nil?)
            claim_frequency_code = struct["claim_frequency_code"]
            payer_responsibility = struct["payer_responsibility"]
            intended_submission_medium = struct["intended_submission_medium"]
            new(
              submitted_at: submitted_at,
              claim_frequency_code: claim_frequency_code,
              payer_responsibility: payer_responsibility,
              intended_submission_medium: intended_submission_medium,
              additional_properties: struct
            )
          end

          # Serialize an instance of ClaimSubmissionRecordCreateOptional to a JSON object
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
            obj.submitted_at&.is_a?(DateTime) != false || raise("Passed value for field obj.submitted_at is not the expected type, validation failed.")
            obj.claim_frequency_code&.is_a?(CandidApiClient::ClaimSubmission::V1::Types::ClaimFrequencyTypeCode) != false || raise("Passed value for field obj.claim_frequency_code is not the expected type, validation failed.")
            obj.payer_responsibility&.is_a?(CandidApiClient::Commons::Types::ClaimSubmissionPayerResponsibilityType) != false || raise("Passed value for field obj.payer_responsibility is not the expected type, validation failed.")
            obj.intended_submission_medium&.is_a?(CandidApiClient::Commons::Types::IntendedSubmissionMedium) != false || raise("Passed value for field obj.intended_submission_medium is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
