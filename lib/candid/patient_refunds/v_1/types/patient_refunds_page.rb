# frozen_string_literal: true

module Candid
  module PatientRefunds
    module V1
      module Types
        class PatientRefundsPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::PatientRefunds::V1::Types::PatientRefund]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
