# frozen_string_literal: true

module Candid
  module PreEncounter
    module PatientMerges
      module V1
        module Types
          # The merge status of a patient.
          class PatientMergeStatus < Internal::Types::Model
            extend Candid::Internal::Types::Union

            discriminant :merge_status

            member -> { Candid::PreEncounter::PatientMerges::V1::Types::NoneStatus }, key: "NONE"
            member -> { Candid::PreEncounter::PatientMerges::V1::Types::AlternativeStatus }, key: "ALTERNATIVE"
            member -> { Candid::PreEncounter::PatientMerges::V1::Types::PrimaryStatus }, key: "PRIMARY"
          end
        end
      end
    end
  end
end
