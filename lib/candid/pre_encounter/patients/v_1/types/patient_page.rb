# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class PatientPage < Internal::Types::Model
            field :items, lambda {
              Internal::Types::Array[Candid::PreEncounter::Patients::V1::Types::Patient]
            }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
