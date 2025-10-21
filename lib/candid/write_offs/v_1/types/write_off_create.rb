# frozen_string_literal: true

module Candid
  module WriteOffs
    module V1
      module Types
        class WriteOffCreate < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::WriteOffs::V1::Types::PatientWriteOffCreate }, key: "PATIENT"
          member -> { Candid::WriteOffs::V1::Types::InsuranceWriteOffCreate }, key: "INSURANCE"
          member -> { Candid::WriteOffs::V1::Types::NonInsurancePayerWriteOffCreate }, key: "NON_INSURANCE_PAYER"
        end
      end
    end
  end
end
