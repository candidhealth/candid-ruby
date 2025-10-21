# frozen_string_literal: true

module Candid
  module ClaimSubmission
    module V1
      module Types
        class ExternalClaimSubmissionCreateOptional < Internal::Types::Model
          field :claim_created_at, -> { String }, optional: true, nullable: false
          field :patient_control_number, -> { String }, optional: true, nullable: false
          field :submission_records, -> { Internal::Types::Array[Candid::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreateOptional] }, optional: false, nullable: false

        end
      end
    end
  end
end
