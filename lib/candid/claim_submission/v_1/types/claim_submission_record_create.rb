# frozen_string_literal: true

module Candid
  module ClaimSubmission
    module V1
      module Types
        # Data about each external submission.
        class ClaimSubmissionRecordCreate < Internal::Types::Model
          field :submitted_at, -> { String }, optional: false, nullable: false
          field :claim_frequency_code, lambda {
            Candid::X12::V1::Types::TypeOfBillFrequencyCode
          }, optional: true, nullable: false
          field :payer_responsibility, lambda {
            Candid::Commons::Types::ClaimSubmissionPayerResponsibilityType
          }, optional: true, nullable: false
          field :intended_submission_medium, lambda {
            Candid::Commons::Types::IntendedSubmissionMedium
          }, optional: true, nullable: false
        end
      end
    end
  end
end
