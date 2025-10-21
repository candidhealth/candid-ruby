# frozen_string_literal: true

module Candid
  module WriteOffs
    module V1
      module Types
        class WriteOff < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::WriteOffs::V1::Types::PatientWriteOff }, key: "PATIENT"
          member -> { Candid::WriteOffs::V1::Types::InsuranceWriteOff }, key: "INSURANCE"
          member -> { Candid::WriteOffs::V1::Types::NonInsurancePayerWriteOff }, key: "NON_INSURANCE_PAYER"
        end
      end
    end
  end
end
