# frozen_string_literal: true

module Candid
  module X12
    module V1
      module Types
        class TypeOfBillCompositeBase < Internal::Types::Model
          field :type_of_facility, -> { Candid::X12::V1::Types::TypeOfFacilityCode }, optional: false, nullable: false
          field :type_of_care, -> { Candid::X12::V1::Types::TypeOfCareCode }, optional: false, nullable: false
          field :frequency_code, -> { Candid::X12::V1::Types::TypeOfBillFrequencyCode }, optional: false, nullable: false

        end
      end
    end
  end
end
