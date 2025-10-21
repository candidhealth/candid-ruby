# frozen_string_literal: true

module Candid
  module ClaimSubmission
    module V1
      module Types
        class ExternalClaimSubmissionCreate < Internal::Types::Model
          field :claim_created_at, -> { String }, optional: false, nullable: false
          field :patient_control_number, -> { String }, optional: false, nullable: false
          field :submission_records, -> { Internal::Types::Array[Candid::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreate] }, optional: false, nullable: false

        end
      end
    end
  end
end
